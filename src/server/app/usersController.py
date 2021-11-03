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
                'password'
            ]
        )
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
