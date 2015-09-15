require 'rails_helper'

RSpec.describe "Browses", type: :request do
  describe "GET /browse/authors" do
    it "works! (now write some real specs)" do
      get "browse/authors"
      expect(response).to have_http_status(200)
    end
    
    describe "authors prefix" do
      
      before(:all) do
        solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
        solr_books_core.delete_by_query('*:*')
        solr_books_core.commit
        solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', author_en: ['abc', 'bca', 'cab'] })
        solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', author_en: 'bca' })
        solr_books_core.commit
      end
      
      it "filters result with prefix" do
        visit "browse/authors"
        expect(page).to have_selector("h3[class=panel-title]", text: "A")
        expect(page).to have_selector("h3[class=panel-title]", text: "B")
        expect(page).to have_selector("h3[class=panel-title]", text: "C")
        [ { name: 'abc', count: 1 }, { name: 'bca', count: 2 }, { name: 'cab', count: 1 }].each do |item|
          value = item[:name].slice(0,1).capitalize + item[:name].slice(1..-1)
          expect(page).to have_selector("a[href='/books?_author=#{item[:name]}']", text: "#{value} (#{item[:count]})")
        end
        click_link "B"
        expect(page).to_not have_selector("h3[class=panel-title]", text: "A")
        expect(page).to have_selector("h3[class=panel-title]", text: "B")
        expect(page).to_not have_selector("h3[class=panel-title]", text: "C")
        [ { name: 'abc', count: 1 }, { name: 'cab', count: 1 }].each do |item|
          value = item[:name].slice(0,1).capitalize + item[:name].slice(1..-1)
          expect(page).to_not have_selector("a[href='/books?_author=#{item[:name]}']", text: "#{value} (#{item[:count]})")
        end
        [ { name: 'bca', count: 2 }].each do |item|
          value = item[:name].slice(0,1).capitalize + item[:name].slice(1..-1)
          expect(page).to have_selector("a[href='/en/books?_author=#{item[:name]}']", text: "#{value} (#{item[:count]})")
        end
      end
    end
  end
end
