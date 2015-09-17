require 'rails_helper'

RSpec.describe BrowseController, type: :controller do
  describe 'GET #index' do
    
    context 'authors' do      
      
      describe 'response header' do
        before do
          get :index, type: "authors"
        end
        it { is_expected.to respond_with :ok }
        it { is_expected.to render_with_layout :application }
        it { is_expected.to render_template :index }
      end
      
      describe 'response content' do
        
        before(:all) do
          Rails.cache.clear
          solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
          solr_books_core.delete_by_query('*:*')
          solr_books_core.commit
          solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', author_en: ['abc', 'bca', 'cab'] })
          solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', author_en: 'bca' })
          solr_books_core.commit          
        end
        
        describe 'instance variables' do
          
        end
        it 'assigns all alphabet as @alphas' do
          get :index, type: "authors"
          alphas = []
          ('A'..'Z').each { |i| alphas << i }
          expect(assigns(:alphas)).to eq(alphas)
        end
        
        it "assigns all authors' prefixes with values as @prefixes_with_values" do
          get :index, type: "authors"
          expect(assigns(:prefixes_with_values)).to eq({ "A" => [{ name: 'abc' , count: 1 }], "B" => [{ name: 'bca', count: 2 }], "C" => [{ name: 'cab' , count: 1 }] })        
        end
        
        describe 'views components' do
          it 'displays link for each alphabet from A to Z' do
            get :index, type: "authors"
            ('a'..'z').each do |alpha|
              expect(response.body).to have_selector("a[href='/browse/authors?char=#{alpha}']", text: alpha.upcase)
            end
          end
          
          it 'displays link for each author with faceting' do
            get :index, type: "authors"
            [ { name: 'abc', count: 1 }, { name: 'bca', count: 2 }, { name: 'cab', count: 1 }].each do |item|
              value = item[:name].slice(0,1).capitalize + item[:name].slice(1..-1)
              expect(response.body).to have_selector("a[href='/books?_author=#{item[:name]}']", text: "#{value} (#{item[:count]})")
            end
          end          
        end
      end
    end       
  end
end
