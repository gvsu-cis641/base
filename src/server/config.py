import os
from dotenv import load_dotenv


class Config(object):
    load_dotenv()
    SECRET_KEY = os.getenv('SECRET_KEY')
    SERVER_IP_ADDRESS = os.getenv('IP_ADDRESS')
    SERVER_PORT = os.getenv('PORT_NUMBER')
    DEBUG_MODE = os.getenv('DEBUG')

    AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')
    AWS_REGION_NAME = os.getenv('AWS_REGION_NAME')

    MAIL_SERVER = os.getenv('MAIL_SERVER')
    MAIL_PORT = os.getenv('MAIL_PORT')
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    MAIL_USE_SSL = os.getenv('MAIL_USE_SSL')
