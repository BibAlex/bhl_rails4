require 'rails_helper'

RSpec.describe HadoopHelper, type: :helper do
  describe "Testing Process Mods" do
    before :all do
      clean_book_tables
      load_book_statuses      
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "sample_mods.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close
      @mods_hash = process_mods(mods_xml.to_s)
    end

    it "should ouput the correct metadata" do
      expect(@mods_hash[:title]).to eq("Indian medicinal plants")
      expect(@mods_hash[:publisher]).to eq("Sudhindra Nath Basu, P�anin�i office; [etc., etc.]")
      expect(@mods_hash[:published_at]).to eq("1918")
      expect(@mods_hash[:edition]).to be_nil
    end

    it "should create and return two authors" do
      expect(@mods_hash[:authors].count).to eq(2)
      expect(Author.count).to eq(2)
    end

    it "should create 2 authors and associate them with the book" do
      expect(Author.find_by_name("Kirtikar, Kanhoba Ranchoddas, 1849-1917")).not_to be_nil
      expect(Author.find_by_name("Basu, Baman Das, 1867-1930")).not_to be_nil
      expect(@mods_hash[:authors]).to include(Author.find_by_name("Kirtikar, Kanhoba Ranchoddas, 1849-1917"))
      expect(@mods_hash[:authors]).to include(Author.find_by_name("Basu, Baman Das, 1867-1930"))
    end

    it "should create a location with the name of Bahadurganj, India" do
      expect(Location.find_by_address("Bahadurganj, India")).not_to be_nil
      expect(@mods_hash[:locations]).to include(Location.find_by_address("Bahadurganj, India"))
    end
  end

  describe "Test metadata ingestion details" do
    before :each do
      clean_book_tables
      load_book_statuses
      load_batch_statuses
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "metadata_single_sample.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close
      ingest_metadata_from_xml_string(mods_xml.to_s)
      @book = Book.find_by_bib_id("indianmedicinalp01kirt")
    end

    it "should add a book with bib_id=indianmedicinalp01kirt" do
      expect(@book).not_to be_nil
    end

    it "should add a book with BIBTex includes title=\"Indian medicinal plants\"," do
      expect(@book.bibtex).to include("title=\"Indian medicinal plants\",")
    end

    it "should add a book with EndNote includes %T Indian medicinal plants" do
      expect(@book.endnote).to include("%T Indian medicinal plants")
    end

    it "should create a volume with job_id=361720 and associate it with the book" do
      expect(@book.volumes.count).to eq(1)
      expect(@book.volumes.first.job_id).to eq(361720)
    end
  end
  
  describe "Test mark finished content" do
    before do
      load_book_statuses
      load_batch_statuses
      load_volume_statuses
      Book.delete_all
      Volume.delete_all
      book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'))      
      batch = Batch.create(status_id: BatchStatus.pending_content.id, id: 1)
      @volume = Volume.create(book_id: book.id, job_id: 1, batch_id: batch.id, status_id: VolumeStatus.pending_content.id)
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "mark_finished_content.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close
      mark_finished_content_volumes(mods_xml.to_s)
    end

    it "should associate finished volumes with batch" do
      expect(@volume.reload.batch_id).to eq(Batch.first.id)
    end
  end  
  
  describe "Test locations ingestion details" do
    before do
      Location.delete_all
      @location = Location.create(address: "address")
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "locations_sample.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close
      ingest_locations_from_xml_string(mods_xml.to_s)
    end

    it "should add coordinates for locations without coordinates" do
      @location.reload
      expect(@location.latitude).not_to be_nil
      expect(@location.longitude).not_to be_nil
    end
  end
  
  describe "Test mark indexed volumes" do
    before do
      load_book_statuses
      load_batch_statuses
      load_volume_statuses
      Book.delete_all
      Volume.delete_all
      Batch.delete_all
      book = Book.create(book_status_id: BookStatus.finished_metadata.id, bib_id: Faker::Base.numerify('#####-#####'))
      @batch = Batch.create(status_id: BatchStatus.pending_indexing.id, id: 1)
      @volume = Volume.create(book_id: book.id, job_id: 1, batch_id: @batch.id, status_id: VolumeStatus.pending_indexing.id)  
      xml_file_path = File.open(File.join(Rails.root, "lib", "assets", "sample_indexing.xml"))
      mods_xml = Nokogiri::XML(xml_file_path)
      xml_file_path.close
      mark_finished_indexing(mods_xml.to_s)
    end

    it "should update batch status" do
      expect(@batch.reload.status_id).to eq(BatchStatus.indexed.id)
    end
  end  
end