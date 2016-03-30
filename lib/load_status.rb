module Loader
  # Should only be used in development and test (if needed)
  class StatusLoader
    def self.load_status
      ["Pending metadata", "Finished metadata"].each do |status|
        BookStatus.find_or_create_by(status_code: status)
      end
      
      ["Pending content", "Pending indexing", "Indexed"].each do |status|
        BatchStatus.find_or_create_by(status_code: status)
      end
      
      ["Pending content", "Pending indexing", "Indexed"].each do |status|
        VolumeStatus.find_or_create_by(status_code: status)
      end
    end
  end
end
