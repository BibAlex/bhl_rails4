module Loader
  # Should only be used in development and test (if needed)
  class StatusLoader
    def self.load_status
      ["Pending metadata", "Finished metadata"].each do |status|
        BookStatus.create(status_code: status)
      end
      
      ["Pending content", "Pending indexing", "Indexed"].each do |status|
        BatchStatus.create(status_code: status)
      end
    end
  end
end
