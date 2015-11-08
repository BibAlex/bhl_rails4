require 'rails_helper'

RSpec.describe HadoopController, type: :controller do
  describe "Test pending metadata" do
    before :each do
      load_book_statuses
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

  describe "Test metadata ingestion" do
    it "should return failed if nothing gets posted" do
      post :ingest_metadata
      expect(response.body).to eq("Error invalid post")
    end

    it "should ingest data and returun Success" do
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "metadata_sample.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close

      post :ingest_metadata, body: mods_xml.to_s
      expect(response.body).to eq("Success")
    end
  end
end
