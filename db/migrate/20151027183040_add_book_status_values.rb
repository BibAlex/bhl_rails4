class AddBookStatusValues < ActiveRecord::Migration
  def change
    ["Pending metadata", "Pending content", "Pending indexing", "Indexed"].each do |status|
      BookStatus.create(:status_code => status)
    end
  end
end
