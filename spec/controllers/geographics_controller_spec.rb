require 'rails_helper'

RSpec.describe GeographicsController, type: :controller do
  describe "GET 'index'" do
    
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it 'has the the title of geographics link' do
      get :index
      expect(@page_title).to eq(I18n.t :geographics_link)
    end
  end

  describe 'GET show' do
    let(:location) {FactoryGirl.create :location}

    it "render the 'show' template" do 
      get :show, id: location.id
      expect(response).to render_template :show
    end


  end
end
