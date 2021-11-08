from app import app, db, usersController
from flask import request, jsonify
import jwt


@app.route('/sign_up', methods=['POST'])
def sign_up():
    email_receive = request.form['email']
    password_payload = {
        'password': request.form['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    first_name_receive = request.form['first_name']
    last_name_receive = request.form['last_name']
    phone_receive = request.form['phone']
    address_receive = request.form['address']
    sex_receive = request.form['sex']
    controller = usersController.UsersController(db)
    response = controller.create_user(
        email_receive,
        password_receive,
        first_name_receive,
        last_name_receive,
        phone_receive,
        address_receive,
        sex_receive
    )
    return response


@app.route('/sign_in', methods=['POST'])
def sign_in():
    email_receive = request.form['email']
    password_payload = {
        'password': request.form['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    controller = usersController.UsersController(db)
    response = controller.get_user(email_receive)
    if response['Item']['password'] == password_receive:
        return jsonify({'result': 'wrong password'})
    else:
        return jsonify({'result': 'wrong password'})


@app.route('/update_user', methods=['POST'])
def update_user():
    email_receive = request.form['email']
    password_payload = {
        'password': request.form['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    first_name_receive = request.form['first_name']
    last_name_receive = request.form['last_name']
    phone_receive = request.form['phone']
    address_receive = request.form['address']
    sex_receive = request.form['sex']
    controller = usersController.UsersController(db)
    response = controller.edit_user(
        email_receive,
        password_receive,
        first_name_receive,
        last_name_receive,
        phone_receive,
        address_receive,
        sex_receive
    )
    return response