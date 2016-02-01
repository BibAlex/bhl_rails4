class BookStatus < ActiveRecord::Base
  has_many :books
  # Statuses variables
    # 1. pending metadata
    # 2. Finished metadata

  def self.pending_metadata
    BookStatus.find_by_status_code("Pending metadata")
  end
  
  def self.finished_metadata
    BookStatus.find_by_status_code("Finished metadata")
  end
end
