require 'rails_helper'

RSpec.describe GeographicsController, type: :controller do
   before(:all) do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit

      solr_locations_core = RSolr::Ext.connect url: SOLR_GEOLOCATIONS
      solr_locations_core.delete_by_query('*:*')
      solr_locations_core.commit

      5.times do |i|
        location = FactoryGirl.create :location
        doc = { address: location.address, formatted_address: location.formatted_address, longitude: location.longitude, latitude: location.latitude }
        solr_locations_core.add(doc)
        solr_locations_core.commit
        solr_locations_core.optimize
        solr_books_core.add(
        { job_id: i, language_facet: 'English', bib_id: 'bib_id',
          title_en: 'title_#{i}', author_en: "author_#{i}",
          subject_en: "subject_#{i}",location_search: location.address,
          location_facet: location.address })
        solr_books_core.commit
      end
    end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it "renders the 'show' template" do
      get :index, range: "10"
      expect(response).to render_template :index
    end
    it 'has the the title of geographics link' do
      get :index
      expect(assigns[:page_title]).to eq(I18n.t 'common.geographics')
    end
  end

  describe 'GET show' do

    it "renders the 'show' template" do
      get :show, address: Location.first.formatted_address
      expect(response).to render_template :show
    end
   it "lists the books in this location" do
     get :show, address: Location.last.address
      expect(assigns[:books].count).not_to eq(0)
   end
   it "shows the name of this location" do
     location = Location.first
     get :show, address: location.address
     expect(assigns[:location_name]).to eq(location.formatted_address)
   end
  it "assigns a book_count" do
    get :show, address: Location.first.formatted_address
    expect(assigns[:books_count]).not_to be nil
  end
  end
end
