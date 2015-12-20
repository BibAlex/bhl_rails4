require 'rails_helper'

RSpec.describe GeographicsController, type: :controller do
   before(:all) do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      5.times do |i|
        location = FactoryGirl.create :location
        solr_books_core.add(
        { job_id: i, language_facet: 'eng', bib_id: 'bib_id',
          title_en: 'title_#{i}', author_en: "author_#{i}",
          subject_en: "subject_#{i}",location_search: location.formatted_address,
          location_facet: "#{location.formatted_address},#{location.longitude},#{location.latitude}" })
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
      expect(assigns[:page_title]).to eq(I18n.t :geographics_link)
    end
    it 'loads all the books in solr on the map' do
      get :index
      count = 
      expect(assigns[:map].markers.count).not_to eq(0)
    end
    it " specifies the range if passed" do 
      range = "10,30,40"
      get :index, range: range
      expect(assigns[:range]).to eq(range)
    end
    it "specifies a default range if no range is passed" do
      get :index
      expect(assigns[:range]).to eq("10,20,30,40,50")
    end
  end

  describe 'GET show' do

    it "renders the 'show' template" do 
      get :show, id: Location.first.id
      expect(response).to render_template :show
    end
   it "lists the books in this location" do
     get :show, id: Location.last.id
      expect(assigns[:books].count).not_to eq(0)
   end
   it "shows the name of this location" do
     location = Location.first
     get :show, id: location.id
     expect(assigns[:location_name]).to eq(location.formatted_address)
   end
  it "assigns a book_count" do
    get :show, id: Location.first.id
    expect(assigns[:books_count]).not_to be nil
  end
  end
end
