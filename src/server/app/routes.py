from app import app, db, usersController, postsController
from flask import request, jsonify
import jwt


@app.route('/')
def home():
    return 'Hello World!'


@app.route('/sign_up', methods=['POST'])
def sign_up():
    email_receive = request.form['email']
    password_payload = {
        'password': request.form['password']
    }
    password_receive = jwt.encode(password_payload, app.config['SECRET_KEY'], algorithm="HS256")
    first_name_receive = request.form['first_name']
    last_name_receive = request.form['last_name']
    address_receive = request.form['address']
    sex_receive = request.form['sex']
    controller = usersController.UsersController(db)
    response = controller.create_user(
        email_receive,
        password_receive,
        first_name_receive,
        last_name_receive,
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
        return jsonify({'result': 'success'})
    else:
        return jsonify({'result': 'wrong password'})


@app.route('/post', methods=['POST'])
def create_post():
    post_id_receive = request.form['post_id']
    post_type_receive = request.form['post_type']
    creator_receive = request.form['creator']
    source_receive = request.form['source']
    destination_receive = request.form['destination']
    date_receive = request.form['date']
    time_receive = request.form['time']
    available_seats_receive = request.form['available_seats']
    total_seats_receive = request.form['total_seats']
    controller = postsController.PostsController(db)
    response = controller.create_post(
        post_id_receive,
        post_type_receive,
        creator_receive,
        source_receive,
        destination_receive,
        date_receive,
        time_receive,
        available_seats_receive,
        total_seats_receive
    )
    return response


@app.route('/post/update', methods=['POST'])
def update_post():
    id_receive = request.form['post_id']
    source_receive = request.form['source']
    destination_receive = request.form['destination']
    date_receive = request.form['date']
    time_receive = request.form['time']
    available_seats_receive = request.form['available_seats']
    total_seats_receive = request.form['total_seats']
    controller = postsController.PostsController(db)
    response = controller.update_post(
        id_receive,
        source_receive,
        destination_receive,
        date_receive,
        time_receive,
        available_seats_receive,
        total_seats_receive
    )
    return response


@app.route('/posts', methods=['GET'])
def load_all_posts():
    creator_receive = request.args.get('creator')
    controller = postsController.PostsController(db)
    response = controller.get_all_posts(
        creator_receive
    )
    return response


@app.route('/post/delete', methods=['POST'])
def delete_post():
    id_receive = request.form['post_id']
    controller = postsController.PostsController(db)
    response = controller.delete_post(
        id_receive
    )
    return response