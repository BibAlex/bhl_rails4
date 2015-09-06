class BookLocation < ActiveRecord::Base
  belongs_to :book
  belongs_to :location
  
  validates :book_id, presence: true
  validates :location_id, presence: true
end
