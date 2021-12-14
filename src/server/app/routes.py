from app import app, db, usersController, postsController, emailHandler
from flask import request, jsonify
import jwt
import json
from os import urandom


@app.route('/sign_up', methods=['POST'])
def sign_up():
    data_received = json.loads(request.data.decode('utf8'))
    email_receive = data_received['email']
    password_payload = {
        'password': data_received['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    verification_code_payload = {
        'email': email_receive,
        'password': password_receive
    }
    verification_code = jwt.encode(verification_code_payload, app.config['SECRET_KEY'], algorithm="HS256")

    first_name_receive = data_received['firstName']
    last_name_receive = data_received['lastName']
    phone_receive = data_received['phone']
    address_receive = data_received['address']
    vehicle_model_receive = data_received['vehicleModel']
    vehicle_color_receive = data_received['vehicleColor']
    controller = usersController.UsersController(db)
    response = controller.create_user(
        email_receive,
        password_receive,
        first_name_receive,
        last_name_receive,
        phone_receive,
        address_receive,
        vehicle_model_receive,
        vehicle_color_receive
    )
    emailHandler.send_verification(first_name_receive, email_receive, verification_code)
    return response


@app.route('/verify_email/<code>')
def verify_email(code):
    code_payload = jwt.decode(code, app.config['SECRET_KEY'], algorithms="HS256")
    controller = usersController.UsersController(db)
    response = controller.verify_user(code_payload['email'], code_payload['password'])
    return 'Email Verification Success! Please return to the app.'


@app.route('/forgot_password', methods=['POST'])
def forgot_password():
    data_received = json.loads(request.data.decode('utf8'))
    email_received = data_received['email']
    controller = usersController.UsersController(db)
    chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    temp_password = ''.join(chars[c % len(chars)] for c in urandom(8))
    emailHandler.send_temp_password(email_received, temp_password)
    password_payload = {
        'password': temp_password
    }
    password_hashed = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    response = controller.set_temp_password(email_received, password_hashed)
    return jsonify({'result': 'success'})


@app.route('/sign_in', methods=['POST'])
def sign_in():
    data_received = json.loads(request.data.decode('utf8'))
    email_receive = data_received['email']
    password_payload = {
        'password': data_received['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    controller = usersController.UsersController(db)
    response = controller.get_user(email_receive)
    if response['ResponseMetadata']['HTTPStatusCode'] == 404:
        return jsonify({'result': 'user not found'})
    if response['Item']['password'] != password_receive:
        return jsonify({'result': 'wrong password'})
    if not response['Item']['emailVerified']:
        return jsonify({'result': 'email unverified'})

    return jsonify({'result': 'success', 'email': email_receive})


@app.route('/update_user', methods=['POST'])
def update_user():
    data_received = json.loads(request.data.decode('utf8'))
    email_receive = data_received['email']
    password_payload = {
        'password': data_received['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    first_name_receive = data_received['firstName']
    last_name_receive = data_received['lastName']
    phone_receive = data_received['phone']
    address_receive = data_received['address']
    vehicle_model_receive = data_received['vehicleModel']
    vehicle_color_receive = data_received['vehicleColor']
    controller = usersController.UsersController(db)
    response = controller.edit_user(
        email_receive,
        password_receive,
        first_name_receive,
        last_name_receive,
        phone_receive,
        address_receive,
        vehicle_model_receive,
        vehicle_color_receive
        )
    return response


@app.route('/delete_user', methods=['POST'])
def delete_user():
    email_receive = request.form['email']
    controller = usersController.UsersController(db)
    response = controller.delete_user(email_receive)
    return response


@app.route('/post', methods=['POST'])
def create_post():
    data_received = json.loads(request.data.decode('utf8'))
    post_id_receive = data_received['post_id']
    post_type_receive = data_received['post_type']
    creator_receive = data_received['creator']
    source_receive = data_received['source']
    destination_receive = data_received['destination']
    time_receive = data_received['time']
    available_seats_receive = data_received['available_seats']
    total_seats_receive = data_received['total_seats']
    controller = postsController.PostsController(db)
    response = controller.create_post(
        post_id_receive,
        post_type_receive,
        creator_receive,
        source_receive,
        destination_receive,
        time_receive,
        available_seats_receive,
        total_seats_receive
    )
    return response


@app.route('/post/update', methods=['POST'])
def update_post():
    data_received = json.loads(request.data.decode('utf8'))
    id_receive = data_received['post_id']
    source_receive = data_received['source']
    destination_receive = data_received['destination']
    time_receive = data_received['time']
    available_seats_receive = data_received['available_seats']
    total_seats_receive = data_received['total_seats']
    controller = postsController.PostsController(db)
    response = controller.update_post(
        id_receive,
        source_receive,
        destination_receive,
        time_receive,
        available_seats_receive,
        total_seats_receive
    )
    return response


@app.route('/posts', methods=['GET'])
def load_all_posts():
    controller = postsController.PostsController(db)
    response = controller.get_all_posts()
    return response


@app.route('/post/delete', methods=['POST'])
def delete_post():
    data_received = json.loads(request.data.decode('utf8'))
    id_receive = data_received['post_id']
    controller = postsController.PostsController(db)
    response = controller.delete_post(
        id_receive
    )
    return response


@app.route('/join_unjoin_ride', methods=['POST'])
def join_ride():
    data_received = json.loads(request.data.decode('utf8'))
    id_receive = data_received['post_id']
    email_receive = data_received['email']
    controller = postsController.PostsController(db)
    response = controller.join_ride(id_receive, email_receive)
    return response
