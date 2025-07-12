#🇳‌🇮‌🇰‌🇭‌🇮‌🇱‌
# Add your details here and then deploy by clicking on HEROKU Deploy button
import os
from os import environ

API_ID = int(environ.get("API_ID", "27775431"))
API_HASH = environ.get("API_HASH", "b70bb1d45a1d05236671d4cc615e40f9")
BOT_TOKEN = environ.get("BOT_TOKEN", "")
OWNER = int(environ.get("OWNER", "6414266397"))
CREDIT = "〱⏤͟͞𝙃 𝙈🐦‍🔥 〄"
AUTH_USER = os.environ.get('AUTH_USERS', '6414266397').split(',')
AUTH_USERS = [int(user_id) for user_id in AUTH_USER]
if int(OWNER) not in AUTH_USERS:
    AUTH_USERS.append(int(OWNER))
  
#WEBHOOK = True  # Don't change this
#PORT = int(os.environ.get("PORT", 8080))  # Default to 8000 if not set
