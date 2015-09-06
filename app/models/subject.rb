class Subject < ActiveRecord::Base
  has_many :book_subjects, dependent: :destroy
  has_many :books, through: :book_subjects
  
  validates :name, presence: true
end
