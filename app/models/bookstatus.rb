class Bookstatus < ActiveRecord::Base
  has_many :books, foreign_key: "status_code"
  validates :code, presence: true, uniqueness: true, length: { minimum: 2, maximum: 2 }
end
