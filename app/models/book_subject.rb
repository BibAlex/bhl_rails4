class BookSubject < ActiveRecord::Base
  belongs_to :book
  belongs_to :subject
  
  validates :book_id, presence: true
  validates :subject_id, presence: true
end
