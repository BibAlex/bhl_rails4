class Location < ActiveRecord::Base
  has_many :book_locations, dependent: :destroy
  has_many :books, through: :book_locations
  belongs_to :country
end
