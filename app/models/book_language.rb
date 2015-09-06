class BookLanguage < ActiveRecord::Base
  belongs_to :book
  belongs_to :language
  
  validates :book_id, presence: true
  validates :language_id, presence: true
end
