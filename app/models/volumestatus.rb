class Volumestatus < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true, length: { minimum: 2, maximum: 2 }
end
