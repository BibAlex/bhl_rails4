class BookStatus < ActiveRecord::Base
  has_many :books
  # Statuses variables
    # 1. pending metadata
    # 2. pending content
    # 3. pending indexing
    # 4. indexed

  def self.pending_metadata
    BookStatus.find_by_status_code("Pending metadata")
  end

  def self.pending_content
    BookStatus.find_by_status_code("Pending content")
  end

  def self.pending_indexing
    BookStatus.find_by_status_code("Pending indexing")
  end

  def self.indexed
    BookStatus.find_by_status_code("Indexed")
  end

end
