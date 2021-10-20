class UsersController(object):
    def __init__(self, db):
        self.table = db.Table('users')

    def create_user(self, email, password, firstName, lastName, address, sex):
        response = self.table.put_item(
            Item={
                'email': email,
                'emailVerified': False,
                'password': password,
                'firstName': firstName,
                'lastName': lastName,
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
