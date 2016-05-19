require 'rails_helper'

RSpec.describe "Geographics", type: :request do
  before(:all) do
      Language.create(code: 'English', name: "english")
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      5.times do |i|
        location = FactoryGirl.create :location
        solr_books_core.add(
        { job_id: i, language_facet: 'English', bib_id: 'bib_id',
          title_en: 'title_#{i}', author_en: "author_#{i}",
          subject_en: "subject_#{i}",location_search: location.formatted_address,
          location_facet: "#{location.formatted_address},#{location.longitude},#{location.latitude}" })
        solr_books_core.commit
      end
    end
  describe "GET /geographics" do
    it "displays a map" do
      visit geographics_path(locale: I18n.locale)
      expect(page).to have_selector("div[id='map']")
    end

    it "displays the pins bar" do
      visit geographics_path(locale: I18n.locale)
      expect(page).to have_selector("div[class='well']")
      expect(page).to have_selector("input[id='check100']")
      expect(page).to have_selector("img[title=\'#{I18n.t 'geographics.blue_pin'}\']")
      expect(page).to have_selector("input[id='check200']")
      expect(page).to have_selector("img[title=\'#{I18n.t 'geographics.green_pin'}\']")
      expect(page).to have_selector("input[id='check300']")
      expect(page).to have_selector("img[title=\'#{I18n.t 'geographics.yellow_pin'}\']")
      expect(page).to have_selector("input[id='check400']")
      expect(page).to have_selector("img[title=\'#{I18n.t 'geographics.orange_pin'}\']")
      expect(page).to have_selector("input[id='check500']")
      expect(page).to have_selector("img[title=\'#{I18n.t 'geographics.red_pin'}\']")
    end

    it "unchecks the pins if not included in the range" do
      visit geographics_path(locale: I18n.locale, range: "100,300,500")
      expect(page).to have_selector("input[checked= 'checked']", count:3)
    end
  end
end