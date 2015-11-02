require 'rails_helper'

RSpec.describe Book, type: :model do

  describe Book, 'FactoryGirl' do
    it 'has a valid factory' do
      expect(build(:book)).to be_valid
    end
  end

  describe Book, 'association' do
    it { should have_many(:book_authors).dependent(:destroy) }
    it { should have_many(:authors) }
    it { should have_many(:book_languages).dependent(:destroy) }
    it { should have_many(:languages) }
    it { should have_many(:book_locations).dependent(:destroy) }
    it { should have_many(:locations) }
    it { should have_many(:book_subjects).dependent(:destroy) }
    it { should have_many(:subjects) }
    it { should have_many(:volumes) }
  end

  describe "meta functions" do

    before do
      @book = FactoryGirl.build(:book)

      volume = FactoryGirl.build(:volume)
      @book.volumes << volume

      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: volume.job_id, language_facet: 'eng', bib_id: 'bib_id' })
      solr_books_core.commit

      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit
      solr_names_found_core.add({ job_id: volume.job_id, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.add({ job_id: volume.job_id, sci_name: 'sci_name_2', page: 1, name_found: 'name_2' })
      solr_names_found_core.commit
    end

    it "returns a list of volume's names" do
      expect(@book.meta_keywords).to eq("sci_name_1, sci_name_2")
    end

  end

  describe "Hadoop functions" do
    before do
      # make sure that book_statuses table is populated
      BookStatus.delete_all
      ["Pending metadata", "Pending content", "Pending indexing", "Indexed"].each do |status|
        BookStatus.create(:status_code => status)
      end

      # add a book in all statuses
      BookStatus.all.each do |book_status|
        Book.create(:book_status_id => book_status.id)
      end
    end

    it "returns a pending metadata book" do
      books = Book.get_pending_metadata_books
      expect(books.count).to eq(1)
    end
  end
end
