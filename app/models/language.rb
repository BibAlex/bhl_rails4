class Language < ActiveRecord::Base
  has_many :book_languages, dependent: :destroy
  has_many :books, through: :book_languages
  
  validates :code, presence: true
end
