# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BhlRails4::Application.initialize!
AUTOCOMPLETE_MAX = 4
BHL_LINK =  "http://beta.bhl.bibalex.org/"
TOP_COLLECTIONS_COUNT = 5
MOST_VIEWED_BOOKS = 3
MAX_NAMES_PER_BOOK = 5
HOME_LOG_ACTIVITIES = 5
PAGE_SIZE = 10
NO_REPLY_EMAIL_ADDRESS = "bhl.team@bibalex.org"
CONTACT_US_EMAIL = "bhl.team@bibalex.org"
UPLOADED_PHOTO_MAX_SIZE = 1
RESIZED_PHOTO_WIDTH = 140
RESIZED_PHOTO_HIGHT = 160
RESIZED_PHOTO_WIDTH_SMALL = 100
RESIZED_PHOTO_HIGHT_SMALL = 120
LOGIN_ATTEMPTS = 1

Recaptcha.configure do |config|
  config.public_key  = ''
  config.private_key = ''
  #config.proxy = ''
end
