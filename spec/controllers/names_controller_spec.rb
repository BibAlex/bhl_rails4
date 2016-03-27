require 'rails_helper'

RSpec.describe NamesController, type: :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "get content right panel" do
    it "should have right panel" do
      get :get_content, id: 8
      he = HierarchyEntry.find_taxon(8)
      name = he.clean_taxon_concept
      expect(response.body).to have_selector("h3", text: "#{name}") 
    end
    
    it "should have species details" do
      get :get_content, id: 8
      expect(response.body).to have_selector("a[href='http://www.eol.org/pages/13']", text: I18n.t('common.species_details'))
    end
    
    it "should have the number of books found" do
      get :get_content, id: 8
      he = HierarchyEntry.find_taxon(8)
      name = he.clean_taxon_concept
      name = name.gsub( /\s/, '+' )
      expect(response.body).to have_selector("b", text: I18n.t('common.name_found_in_books', count: 0))
    end
    
  end
  describe "GET 'show'" do
    it "returns kingdoms" do
      get "show"
      expect(response).to be_success
      expect(response.body).to include('Animalia')
      # I know this is a hard coded string, but this is a name of a kingdom, and I don't think it will ever change
    end
  end
  
  describe "GET 'get_content'" do
    it "returns name of a taxon" do
      he = HierarchyEntry.find_siblings(DEFAULT_HIERARCHY_ID, 0).first
      get "get_content", id: he.id
      expect(response).to be_success
      expect(response.body).to include(he.clean_taxon_concept)
    end
  end
end
