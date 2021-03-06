require 'rails_helper'
 
 RSpec.describe "Activities", type: :request do
   
   before do
      Rails.cache.clear
      @user = FactoryGirl.create(:user, active: true, username: "user_activity", email: "user_activity@example.com", guid: "activity")
      @collection = FactoryGirl.create(:collection, user: @user, title: "new_collection", is_public: true)
    end
   
   describe "index" do
     
     before do
       visit activities_path(locale: I18n.locale)
     end
      
      it "displays a link for filter activities by rate" do
        expect(page).to have_selector("a[onclick=\"filter_activities('rate', 'desc');\"]", text: I18n.t('common.rate'))
      end
      
      it "displays a link for filter activities by comments" do
        expect(page).to have_selector("a[onclick=\"filter_activities('comments', 'desc');\"]", text: I18n.t('common.comments'))
      end
      
      it "displays a link for filter activities by collections" do        
        expect(page).to have_selector("a[onclick=\"filter_activities('collections', 'desc');\"]", text: I18n.t('common.collections'))
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




