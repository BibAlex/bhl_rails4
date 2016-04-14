# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BhlRails4::Application.initialize!
AUTOCOMPLETE_MAX = 4
BHL_LINK =  "http://bhl.bibalex.org/"
TOP_COLLECTIONS_COUNT = 5
MOST_VIEWED_BOOKS = 3
MAX_NAMES_PER_BOOK = 5
HOME_LOG_ACTIVITIES = 5
PAGE_SIZE = 10
NO_REPLY_EMAIL_ADDRESS = "bhl.team@bibalex.org"
CONTACT_US_EMAIL = ""
UPLOADED_PHOTO_MAX_SIZE = 1
RESIZED_PHOTO_WIDTH = 140
RESIZED_PHOTO_HIGHT = 160
RESIZED_PHOTO_WIDTH_SMALL = 100
RESIZED_PHOTO_HIGHT_SMALL = 120
LOGIN_ATTEMPTS = 3
FACET_COUNT = 4
LIMIT_CAROUSEL = 4
MAX_NO_ABUSE = 1
LIMIT_BOOK_COMMENTS = 4
TAB_GALLERY_PAGE_SIZE = 9
DEFAULT_HIERARCHY_ID = 3
HLPRE = '<span class="highlight">'
HLPOST = '</span>'


DAR_JAR_API_URL = 'http://viewer.bhl.bibalex.org/book_viewer/?locale=en&LocaleButtons=disabled&book_id=DAF-Job:[JOBID]'
DAR_JAR_API_URL_STRING = '[JOBID]'
DAR_JAR_API_URL_LANGUAGE = "[LANGUAGE]"
DAR_API_METADATA = ''
DAR_API_METADATA_BIBID_STRING = '[BIBID]'
DOWNLOAD_QUERY_SIZE = 100
 
DAR_API_THUMBNAIL = ''
DAR_API_THUMBNAIL_JOBID_STRING = '[JOBID]'
 
DAR_API_CONTENT = ''
DAR_API_CONTENT_JOBID_STRING = '[JOBID]'

BATCH_LIMIT = 20

# old path: content60.eol.org/content
EOL_CONTENT_PATH = "http://media.eol.org/content/"

Recaptcha.configure do |config|
  config.public_key  = '6LdJKQYTAAAAAHCk2TryY75ghOVyMtTIYpmhkREq'
  config.private_key = '6LdJKQYTAAAAADunqil2L2r1Gr4FEm1LtuZ_dlwb'
  #config.proxy = ''
end
