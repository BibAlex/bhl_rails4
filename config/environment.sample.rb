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
CONTACT_US_EMAIL = "walaa.elsayed@eol.org"
UPLOADED_PHOTO_MAX_SIZE = 1
RESIZED_PHOTO_WIDTH = 140
RESIZED_PHOTO_HIGHT = 160
RESIZED_PHOTO_WIDTH_SMALL = 100
RESIZED_PHOTO_HIGHT_SMALL = 120
LOGIN_ATTEMPTS = 1
FACET_COUNT = 4
LIMIT_CAROUSEL = 4
MAX_NO_ABUSE = 1
LIMIT_BOOK_COMMENTS = 4
TAB_GALLERY_PAGE_SIZE = 9

DAR_JAR_API_URL = 'http://viewer.beta.bhl.bibalex.org/book_viewer/?locale=en&LocaleButtons=disabled&book_id=DAF-Job:[JOBID]'
DAR_JAR_API_URL_STRING = '[JOBID]'
DAR_JAR_API_URL_LANGUAGE = "[LANGUAGE]"
DAR_API_METADATA = 'http://api.dar.bibalex.org/DarAccessLayer/[BIBID]/getStream/descMetadata'
DAR_API_METADATA_BIBID_STRING = '[BIBID]'
DOWNLOAD_QUERY_SIZE = 100
 
DAR_API_THUMBNAIL = 'http://api.dar.bibalex.org/DarAccessLayer/DAF-Job:[JOBID]/Thumbnail'
DAR_API_THUMBNAIL_JOBID_STRING = '[JOBID]'
 
DAR_API_CONTENT = 'http://api.dar.bibalex.org/DarAccessLayer/DAF-Job:[JOBID]/Derivative/XML/Content'
DAR_API_CONTENT_JOBID_STRING = '[JOBID]'

Recaptcha.configure do |config|
  config.public_key  = '6LdJKQYTAAAAAHCk2TryY75ghOVyMtTIYpmhkREq'
  config.private_key = '6LdJKQYTAAAAADunqil2L2r1Gr4FEm1LtuZ_dlwb'
  #config.proxy = ''
end