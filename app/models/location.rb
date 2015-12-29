class Location < ActiveRecord::Base
  has_many :book_locations, dependent: :destroy
  has_many :books, through: :book_locations
  belongs_to :country

  def self.get_by_lattitude_and_longitude(latitude, longitude)
    Location.where(
         "CAST(longitude as decimal(10,4)) = "\
         "CAST(#{latitude} as decimal(10,4)) "\
         "AND CAST(latitude as decimal(10,4)) = "\
         "CAST(#{longitude} as decimal(10,4))")
  end  
end
