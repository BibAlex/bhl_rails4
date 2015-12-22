require 'rails_helper'
require_relative '../../lib/bhl/login'
include BHL::Login

RSpec.describe CollectionsController, type: :controller do
  
  render_views
  
  def fill_solr
    solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
    solr_books_core.delete_by_query('*:*')
    solr_books_core.commit
    solr_books_core.add({ job_id: 1, language_facet: 'eng', bib_id: 'bib_id', title_en: 'title_1', author_en: "author_1", subject_en: "subject_1"  })
    solr_books_core.add({ job_id: 2, language_facet: 'eng', bib_id: 'bib_id_2', title_en: 'title_2', author_en: "author_2", subject_en: "subject_2" })
    solr_books_core.commit
  end
  
  before(:all) do 
    @logged_in_user = FactoryGirl.create(:user)
    @user = FactoryGirl.create(:user)  
  end
  
  describe "show collection" do
    before(:all) do 
      fill_solr
      @vol_1 = FactoryGirl.create(:volume, book_id: 1, job_id: 1)
      @vol_2 = FactoryGirl.create(:volume, book_id: 1, job_id: 2)
      
      @private_collection = FactoryGirl.create(:collection, user_id: @logged_in_user.id, is_public: false)
      @public_collection = FactoryGirl.create(:collection, user_id: @user.id, is_public: true)
      @empty_collection = FactoryGirl.create(:collection, user_id: @user.id, is_public: true)
      
      # volumes in private collection
      @c1_v1 = FactoryGirl.create(:collection_volume, collection_id: @private_collection.id, volume_id: @vol_1.job_id, position: 1)
      @c1_v2 = FactoryGirl.create(:collection_volume, collection_id: @private_collection.id, volume_id: @vol_2.job_id, position: 2)
      
      # volumes in public collection
      @c2_v1 = FactoryGirl.create(:collection_volume, collection_id: @public_collection.id, volume_id: @vol_1.job_id, position: 1)
      @c2_v2 = FactoryGirl.create(:collection_volume, collection_id: @public_collection.id, volume_id: @vol_2.job_id, position: 2)
    end

    describe "show collection's info" do
      
      context "private collection" do
        it "should not display private collection page for unauthenticated user" do
          log_in(@user)
          get :show, id: @private_collection.id
          expect(response).to redirect_to("/en/collections")
        end
        it "should not display collection page for unsigned user" do
          log_out
          get :show, id: @private_collection.id
          expect(response).to redirect_to("/users/login")
        end  
        it "should display edit collection link for collection owned by current user" do
          log_in(@logged_in_user)
          get :show, id: @private_collection.id
          expect(response).to have_link "/en/collections/#{@private_collection.id}/edit"
        end
      end
      
      context "public collection" do
        before(:each) do
          log_in(@user)
        end
        
        it "should display collection title" do
          get :show, id: @public_collection.id
          expect(response.body).to have_selector 'h2', text: "#{@public_collection.title}", exact: false
        end
        
        it "should display collection description" do 
          get :show, id: @public_collection.id
          expect(response.body).to have_selector 'p', text: "#{@public_collection.description}", exact: false
        end
        
        it "should display link to the owner of collection" do
          get :show, id: @public_collection.id
          expect(response.body).to have_selector "a", text: "#{@user.real_name}"  
        end
        
        it "should have collection creation date" do
          get :show, id: @public_collection.id
          expect(response.body).to have_content "#{@public_collection.created_at}"
        end
      end  
    end

    describe "show collection's volumes" do
      before(:each) do
        log_in(@user)
      end
      
      context "collection with no volumes" do
        it "should have no books found string if there is no books" do
          get :show, id: @empty_collection.id
          expect(response.body).to have_content "#{I18n.t('common.no_books_found')}"
        end
      end
      
      context "collection with volumes" do
        describe "volume's info" do
          it "should list all books" do
            get :show, id: @public_collection.id
            expect(response.body).to have_selector 'span', text: 1.to_s
            expect(response.body).to have_selector 'span', text: 2.to_s
            expect(response.body).to have_css 'span.badge'
          end
          
          it "should have an open link for each book" do
            get :show, id: @public_collection.id
            expect(response.body).to have_selector 'a', text: "title_1"
            expect(response.body).to have_selector 'a', text: "title_2"
          end
          
          it "should display the date of addition of the book to the collection" do
            get :show, id: @public_collection.id
            expect(response.body).to have_selector 'small', text: "#{@vol_1.created_at}", 
              exact: false
          end
          
          it "should have pagination bar" do
            20.times { |i| FactoryGirl.create(:collection_volume, volume_id: @vol_1.job_id,
               collection_id: @public_collection.id, position: i)}
            get :show, id: @public_collection.id
            expect(response.body).to have_css 'div.pagination'
          end
        end
        
        describe "side links" do
          context "private collection" do
            it "should change book order to higher order" do
              request.env["HTTP_REFERER"] = "/en/collections/show/#{@private_collection.id}"
              get :move_up, collection_volume_id: @c2_v2.id, id: @private_collection.id
              expect(response).to redirect_to("/en/collections/show/#{@private_collection.id}")
              expect(@c2_v2.reload.position).to equal(1)
              expect(@c2_v1.reload.position).to equal(2)
              @c2_v1.update_attributes(position: 1)
              @c2_v2.update_attributes(position: 2)
            end
  
            it "should change book order to lower order" do
              request.env["HTTP_REFERER"] = "/en/collections/show/#{@private_collection.id}"
              get :move_down, collection_volume_id: @c2_v1.id, id: @private_collection.id
              response.should redirect_to("/en/collections/show/#{@private_collection.id}")
              expect(@c2_v2.reload.position).to equal(1)
              expect(@c2_v1.reload.position).to equal(2)
              @c2_v1.update_attributes(position: 1)
              @c2_v2.update_attributes(position: 2)
            end
            
            it "should delete book from collection" do
              request.env["HTTP_REFERER"] = "/collections/show/#{@private_collection.id}"
              lambda do
                get :delete_book, collection_volume_id: @c2_v1.id, id: @private_collection.id
                expect(response).to redirect_to("/collections/show/#{@private_collection.id}")
                expect(@c2_v2.reload.position).to equal(1)
              end.should change(CollectionVolume, :count).by(-1)    
            end            
          end
          
          context "public collection" do
            it "should have a read book link for each book" do
              get :show, id: @public_collection.id
              expect(response.body).to have_selector 'a', 
              text: "#{I18n.t('collection.book_details_read')}" 
            end
  
            it "should have an detail link for each book" do
              get :show, id: @public_collection.id
              expect(response.body).to have_selector 'a',
              text: "#{I18n.t('collection.book_details_details')}" 
            end
          end     
        end
      end
    end
    describe "comments" do
      before(:each) do
        log_in(@user)
      end
      it "should render reviews partial" do
        get :show, id: @public_collection.id
        expect(response.body).to have_content "#{I18n.t('common.reviews')}"
      end
    end
  end
end
