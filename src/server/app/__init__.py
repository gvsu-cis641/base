from flask import Flask
from config import Config
import boto3


app = Flask(__name__)
app.config.from_object(Config)
db = boto3.resource(
    'dynamodb',
    aws_access_key_id=Config.AWS_ACCESS_KEY_ID,
    aws_secret_access_key=Config.AWS_SECRET_ACCESS_KEY,
    region_name=Config.AWS_REGION_NAME
)

from app import routes