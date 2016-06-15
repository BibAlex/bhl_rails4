class BatchStatus < ActiveRecord::Base
  # 1. pending content
  # 2. pending indexing
  # 3. indexed

  def self.pending_content
    BatchStatus.find_by_status_code('Pending content')
  end

  def self.pending_indexing
    BatchStatus.find_by_status_code('Pending indexing')
  end

  def self.indexed
    BatchStatus.find_by_status_code('Indexed')
  end
end
