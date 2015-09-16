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
    it { should have_one(:bookstatus) }
  end
  
  describe Book, 'validation' do
    it "is invalid without title" do
      expect(FactoryGirl.build(:book, title: nil)).to_not be_valid
    end
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
end
