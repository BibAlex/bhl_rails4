require 'rails_helper'

RSpec.describe NamesController, type: :controller do

  describe "GET 'index'" do
    it 'returns http success' do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it 'returns kingdoms' do
      get 'show'
      expect(response).to be_success
      expect(response.body).to include('Animalia')
      # I know this is a hard coded string, but this is a name of a kingdom, and I don't think it will ever change
    end
  end

  describe "GET 'get_content'" do
    it 'returns name of a taxon' do
      he = HierarchyEntry.find_siblings(DEFAULT_HIERARCHY_ID, 0).first
      get 'get_content', id: he.id
      expect(response).to be_success
      expect(response.body).to include(he.clean_taxon_concept)
    end
  end
end
