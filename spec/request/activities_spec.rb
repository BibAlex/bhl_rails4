require 'rails_helper'
 
 RSpec.describe "Browses", type: :request do
   
   before(:all) do
      Rails.cache.clear
      @user = FactoryGirl.create(:user, active: true, username: "user_activity", email: "user_activity@example.com", guid: "activity")
      @collection = FactoryGirl.create(:collection, user: @user, title: "new_collection", is_public: true)
      @collection_create_activity = FactoryGirl.create(:activity, activitable_id: @collection.id, activitable_type: "collection", activitable_title: "new_collection",
                                    action: "create", user_id: @user.id, created_at: Time.now)
    end
   
   describe "index" do
     
     before do
       visit activities_path(locale: I18n.locale)
     end
      
      it "displays a link for filter activities by rate" do
        expect(page).to have_selector("a[onclick=\"filter_activities('rate', 'DESC');\"]", text: I18n.t('common.rate'))
      end
      
      it "displays a link for filter activities by comments" do
        expect(page).to have_selector("a[onclick=\"filter_activities('comments', 'DESC');\"]", text: I18n.t('common.comments'))
      end
      
      it "displays a link for filter activities by collections" do        
        expect(page).to have_selector("a[onclick=\"filter_activities('collections', 'DESC');\"]", text: I18n.t('common.collections'))
      end      
      
      describe "activity entry" do
        
        it "display a link for activity owner" do
           expect(page).to have_selector("div[class='media']") do |div|
            expect(div).to have_selector("a[href='/#{I18n.locale}/users/#{@user.id}?tab=profile']", text: @user.real_name)
          end
        end
        
        it "display a link for activity object" do
         expect(page).to have_selector("div[class='media']") do |div|
            expect(div).to have_selector("a[href='/#{I18n.locale}/collections/#{@collection.id}']", text: @collection.title)
          end        
        end
        
        it "display a link for activity time" do
          expect(page).to have_selector("div[class='media']") do |div|
            expect(div).to have_selector("small[class='text-muted']", text: "#{I18n.t('common.at')} #{@collection_create_activity.created_at}")
          end
        end
        
        it "display a link for activity action" do
          expect(page).to have_selector("div[class='media']") do |div|
            expect(div).to have_selector("strong", text: activity_action_and_object(@collection_create_activity))
          end
        end        
      end  
    end  
 end




