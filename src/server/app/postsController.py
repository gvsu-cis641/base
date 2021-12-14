import json
import decimal
from botocore.exceptions import ClientError


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return str(o)
        return super(DecimalEncoder, self).default(o)

class Comment(object):
    def __init__(self, creator, time, content):
        self.creator = creator
        self.time = time
        self.content = content

    def get_creator(self):
        return self.creator

    def get_time(self):
        return self.time

    def get_content(self):
        return self.content

    def set_content(self, content):
        self.content = content

    def to_json(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)


class PostsController(object):
    def __init__(self, db):
        self.table = db.Table('posts')

    def create_post(self, post_id, post_type, creator_email, source, destination, time, available_seats, total_seats):
        response = self.table.put_item(
            Item={
                'postId': post_id,
                'postType': post_type,
                'creatorEmail': creator_email,
                'source': source,
                'destination': destination,
                'time': time,
                'availableSeats': available_seats,
                'totalSeats': total_seats,
                'passengers': [creator_email],
                'comments': []
            }
        )
        return response

    def get_all_posts(self):
        response = self.table.scan()
        data = json.dumps(response['Items'], cls=DecimalEncoder)
        return data

    def get_post_by_id(self, post_id):
        response = self.table.get_item(
            Key={
                'postId': post_id
            }
        )
        return response['Item']

    def update_post(self, post_id, source, destination, time, available_seats, total_seats):
        response = self.table.update_item(
            Key={
                'postId': post_id
            },
            UpdateExpression='SET source = :source, destination = :destination, time = :time, '
                             'available_seats = :availableSeats, totalSeats = :total_seats',
            ExpressionAttributeValues={
                ':source': source,
                ':destination': destination,
                ':time': time,
                ':availableSeats': available_seats,
                ':totalSeats': total_seats
            },
            ReturnValues='UPDATED_NEW'
        )
        return response

    def delete_post(self, post_id):
        response = self.table.delete_item(
            Key={
                'postId': post_id
            }
        )
        return response

    def join_ride(self, post_id, email):
        try:
            follow_response = self.table.update_item(
                Key={
                    'postId': post_id
                },
                UpdateExpression='SET passengers = list_append(passengers, :email)',
                ExpressionAttributeValues={
                    ':email': [email],
                    ':emailSingle': email
                },
                ConditionExpression='not(contains(passengers, :emailSingle))',
                ReturnValues='UPDATED_NEW'
            )
        except ClientError as e:
            if e.response['Error']['Code'] == 'ConditionalCheckFailedException':
                passengers = self.get_post_by_id(post_id)['passengers']
                passengers.remove(email)
                unfollow_response = self.table.update_item(
                    Key={
                        'postId': post_id
                    },
                    UpdateExpression='SET passengers = :passengers',
                    ExpressionAttributeValues={
                        ':passengers': passengers
                    },
                    ReturnValues='UPDATED_NEW'
                )
                return unfollow_response
            else:
                raise e
        return follow_response

    def add_comment(self, post_id, creator, time, content):
        comment = Comment(creator, time, content)
        response = self.table.update_item(
            Key={
                'postId': post_id
            },
            UpdateExpression='SET comments = list_append(comments, :comment)',
            ExpressionAttributeValues={
                ':comment': [comment.to_json()]
            },
            ReturnValues='UPDATED_NEW'
        )
        return response