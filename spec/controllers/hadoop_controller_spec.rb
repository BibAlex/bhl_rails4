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

  describe "Test pending content" do    
    
    context "when there are volumes pending for content" do
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
        book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'))
        @volume = Volume.create(book_id: book.id, job_id: 1)
      end
      
      it "has OK status code" do
        get :pending_content
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Volumes"].count).to eq(1)
      end
      
      it 'returns correct volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        job_id = json_response["Volumes"][0]
        expect(job_id).to eq(@volume.job_id.to_s)
      end
      
      it 'returns id of created batch' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        batch_id = json_response["batch_id"][0]
        expect(batch_id).to eq(Batch.first.id.to_s)
      end
    end
    
    context "when there are not volumes pending for content" do
      
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
        book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'))
        batch = Batch.create
        @volume = Volume.create(book_id: book.id, job_id: 1, batch_id: batch.id)
      end
      
      it "has OK status code" do
        get :pending_content
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Volumes"].count).to eq(0)
      end
      
      it 'returns correct volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        job_id = json_response["Volumes"][0]
        expect(job_id).to be_blank
      end
      
      it 'does not create new batch' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        batch_id = json_response["batch_id"][0]
        expect(batch_id).to be_blank
      end
      
    end
    
    context "when there are not any volumes" do
      
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
      end
      
      it "has OK status code" do
        get :pending_content
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Volumes"].count).to eq(0)
      end
      
      it 'returns correct volumes pending on content' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        job_id = json_response["Volumes"][0]
        expect(job_id).to be_blank
      end
      
      it 'does not create new batch' do
        get :pending_content
        json_response = ActiveSupport::JSON.decode(response.body)
        batch_id = json_response["batch_id"][0]
        expect(batch_id).to be_blank
      end
      
    end    
  end
  
  describe "Test mark finished content" do
    
    context "when nothing gets posted" do          
      it "returns failed if nothing gets posted" do
        post :mark_finished_content
        expect(response.body).to eq("Error invalid post")
      end         
    end
    
    context "when content file is valid" do      
      before do
        xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "mark_finished_content.xml"))
        @volumes_xml = Nokogiri::XML(xml_file_path)
        xml_file_path.close
      end      
      
      it "should ingest data and returun Success" do
        post :mark_finished_content, body: @volumes_xml.to_s
        expect(response.body).to eq("Success")
      end      
    end    
  end
  
  
  describe "Test ingest content" do
    
    context "when nothing gets posted" do          
      it "returns failed if nothing gets posted" do
        post :ingest_content
        expect(response.body).to eq("Error invalid post")
      end         
    end
    
    context "when content file is valid" do      
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
        Batch.create(id: 1, status_id: BatchStatus.pending_content.id)
        @content = File.open(File.join(Rails.root, "lib", "assets", "names_sample")).read
      end      
      
      it "should ingest data and returun Success" do
        post :ingest_content, batch_id: 1, body: @content
        expect(response.body).to eq("Success")
      end      
    end    
  end

  
  describe "Locations with missing coordinates" do
    
    it "has OK status code" do
      get :missing_locations
      expect(response).to have_http_status(:ok)
    end
    
    context "when there are some missing locations" do
      before do
        Location.delete_all
        @location_without_coordinates = Location.create(address: "address without coordinates")
        Location.create(address: "address with coordinates", latitude: 4.5, longitude: 5.5)
      end
      
      it 'returns correct count of locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Locations"].count).to eq(1)
      end
      
      it 'returns correct locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        address = json_response["Locations"][0]
        expect(address).to eq(@location_without_coordinates.address)
      end
    end
    
    context "when there are not any missing locations" do
      before do
        Location.delete_all
        Location.create(formatted_address: "address with coordinates", latitude: 4.5, longitude: 5.5)
      end
      
      it 'returns correct count of locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Locations"].count).to eq(0)
      end
      
      it 'returns correct locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        address = json_response["Locations"][0]
        expect(address).to be_blank
      end
    end
    
    context "when there are not any locations" do
      before do
        Location.delete_all
      end
      
      it 'returns correct count of locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["Locations"].count).to eq(0)
      end
      
      it 'returns correct locations without coordinates' do
        get :missing_locations
        json_response = ActiveSupport::JSON.decode(response.body)
        address = json_response["Locations"][0]
        expect(address).to be_blank
      end
    end
  end
  
  
  describe "Test pending indexing" do    
    
    context "when there are volumes pending for indexing" do
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all        
        @book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'), title: "title",
                            title_alternative: "title alternative", publisher: "publisher", published_at: "published_at")
        @book.languages << Language.create(code: 'eng', name: "english")
        @book.locations << Location.create(address: "123 detailed address", longitude: 0.0, latitude: 2.5)
        @book.authors << Author.create(name: "author")
        @book.subjects << Subject.create(name: "subject")
        @book.save
        batch = Batch.create(status_id: BatchStatus.pending_indexing.id)
        @volume = Volume.create(book_id: @book.id, job_id: 1, batch_id: batch.id)
      end
      
      it "has OK status code" do
        get :pending_indexing
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on indexing' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["books"].count).to eq(1)
      end
      
      it 'returns correct metadata(job_id) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        job_id = json_response["books"][0]["job_id"]
        expect(job_id).to eq(@volume.job_id.to_s)
      end
      
      it 'returns correct metadata(bibID) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        bib_id = json_response["books"][0]["bibID"]
        expect(bib_id).to eq(@book.bib_id.to_s)
      end
      
      it 'returns correct metadata(title) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        title = json_response["books"][0]["titles"]
        expect(title).to eq([@book.title, @book.title_alternative])
      end
      
      it 'returns correct metadata(main title) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        main_title = json_response["books"][0]["main_title"]
        expect(main_title).to eq(@book.title)
      end
      
      it 'returns correct metadata(publisher) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        publisher = json_response["books"][0]["publishers"]
        expect(publisher).to eq([@book.publisher])
      end
      
      it 'returns correct metadata(date) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        date = json_response["books"][0]["date"]
        expect(date).to eq(@book.published_at)
      end
      
      it 'returns correct metadata(languages) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        languages = json_response["books"][0]["languages"]
        expect(languages).to eq(["\"english\""])
      end
      
      it 'returns correct metadata(address) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        location_address = json_response["books"][0]["location_address"]
        expect(location_address).to eq("123 detailed address")
      end
      
      it 'returns correct metadata(longitude) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        long = json_response["books"][0]["long"]
        expect(long).to eq("0.0")
      end
      
      it 'returns correct metadata(latitude) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        lat = json_response["books"][0]["lat"]
        expect(lat).to eq("2.5")
      end
      
      it 'returns correct metadata(authors) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        authors = json_response["books"][0]["authors"]
        expect(authors).to eq(["\"author\""])
      end
      
      it 'returns correct metadata(authors) of pending books' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        subjects = json_response["books"][0]["subjects"]
        expect(subjects).to eq(["\"subject\""])
      end

    end
    
    context "when there are not volumes pending for indexing" do
      
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
        book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'))
        @volume = Volume.create(book_id: book.id, job_id: 1)
      end
      
      it "has OK status code" do
        get :pending_indexing
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on content' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["books"].count).to eq(0)
      end      
    end
    
    context "when there are not any volumes" do
      
      before do
        load_book_statuses
        load_batch_statuses
        Book.delete_all
        Volume.delete_all
        Batch.delete_all
      end
      
      it "has OK status code" do
        get :pending_indexing
        expect(response).to have_http_status(:ok)
      end
      
      it 'returns correct number of volumes pending on content' do
        get :pending_indexing
        json_response = ActiveSupport::JSON.decode(response.body)
        expect(json_response["books"].count).to eq(0)
      end      
    end    
  end
  
  
  describe "Test locations ingestion" do
    
    context "when nothing gets posted" do          
      it "returns failed if nothing gets posted" do
        post :ingest_locations
        expect(response.body).to eq("Error invalid post")
      end         
    end
    
    context "when locations file is valid" do      
      before do
        xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "locations_sample.xml"))
        @mods_xml = Nokogiri::XML(xml_file_path)
        xml_file_path.close
      end      
      
      it "should ingest data and returun Success" do
        post :ingest_locations, body: @mods_xml.to_s
        expect(response.body).to eq("Success")
      end      
    end    
  end
  
  
  describe "Test finished indexing" do
    
    context "when nothing gets posted" do          
      it "returns failed if nothing gets posted" do
        post :finished_indexing
        expect(response.body).to eq("Error invalid post")
      end         
    end
    
    context "when indexing file is valid" do      
      before do
        xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "sample_indexing.xml"))
        @volumes_xml = Nokogiri::XML(xml_file_path)
        xml_file_path.close        
      end      
      
      it "should ingest data and returun Success" do
        post :finished_indexing, body: @volumes_xml.to_s
        expect(response.body).to eq("Success")
      end      
    end    
  end  
end
