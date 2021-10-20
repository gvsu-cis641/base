from app import app
from config import Config


if __name__ == '__main__':
    app.run(Config.SERVER_IP_ADDRESS, Config.SERVER_PORT, debug=Config.DEBUG_MODE)