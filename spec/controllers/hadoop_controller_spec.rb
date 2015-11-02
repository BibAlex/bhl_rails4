require 'rails_helper'

RSpec.describe HadoopController, type: :controller do
  describe "Test pending metadata" do
    before :each do
      # make sure that book_statuses table is populated
      BookStatus.delete_all
      ["Pending metadata", "Pending content", "Pending indexing", "Indexed"].each do |status|
        BookStatus.create(:status_code => status)
      end

      Book.delete_all
      # add a book in all statuses
      BookStatus.all.each do |book_status|
        Book.create(:book_status_id => book_status.id, :bib_id => Faker::Base.numerify('#####-#####'))
      end
    end

    it 'should return an empty json if no pending items found' do
      Book.where(:book_status_id => BookStatus.pending_metadata.id).delete_all
      get :pending_metadata
      expect(response).to have_http_status(:ok)
      json_response = ActiveSupport::JSON.decode(response.body)
      expect(json_response["Books"].count).to eq(0)
    end

    it 'Should return a book in pending metadata' do
      get :pending_metadata
      expect(response).to have_http_status(:ok)
      json_response = ActiveSupport::JSON.decode(response.body)
      expect(json_response["Books"].count).to eq(1)
      id = json_response["Books"][0]
      expect(Book.find_by_bib_id(id).book_status_id).to eq(BookStatus.pending_metadata.id)
    end
  end
end
