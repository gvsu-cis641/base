class UsersController(object):
    def __init__(self, db):
        self.table = db.Table('users')

    def create_user(self, email, password, firstName, lastName, phone, address, sex):
        response = self.table.put_item(
            Item={
                'email': email,
                'emailVerified': False,
                'password': password,
                'firstName': firstName,
                'lastName': lastName,
                'phone': phone,
                'address': address,
                'sex': sex
            })
        return response

    def get_user(self, email):
        response = self.table.get_item(
            Key={
                'email': email
            },
            AttributesToGet=[
                'password',
                'emailVerified'
            ]
        )
        try:
            item = response['Item']
        except KeyError:
            response['ResponseMetadata']['HTTPStatusCode'] = 404
        return response

    def edit_user(self, email, password, firstName, lastName, phone, address, sex):
        response = self.table.update_item(
            Key={
                'email': email
            },
            AttributeUpdates={
                'password': {
                    'Value': password,
                    'Action': 'PUT'
                },
                'firstName': {
                    'Value': firstName,
                    'Action': 'PUT'
                },
                'lastName': {
                    'Value': lastName,
                    'Action': 'PUT'
                },
                'phone': {
                    'Value': phone,
                    'Action': 'PUT'
                },
                'address': {
                    'Value': address,
                    'Action': 'PUT'
                },
                'sex': {
                    'Value': sex,
                    'Action': 'PUT'
                }
            },

            ReturnValues="UPDATED_NEW"
        )
        return response

    def verify_user(self, email, password):
        get_response = self.table.get_item(
            Key={
                'email': email
            },
            AttributesToGet=[
                'password'
            ]
        )
        if password == get_response['Item']['password']:
            response = self.table.update_item(
                Key={
                    'email': email
                },
                AttributeUpdates={
                    'emailVerified': {
                        'Value': True,
                        'Action': 'PUT'
                    }
                }
            )
            return response
        else:
            return 'bad request', 400

    def delete_user(self, email):
        response = self.table.delete_item(
            Key={
                'email': email
            }
        )
        return response
