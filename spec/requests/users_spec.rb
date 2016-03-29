require 'rails_helper'
RSpec.describe "Users", type: :request do

  describe "signup" do

    before do
      visit new_user_path(locale: I18n.locale)
    end

    describe "new user form" do

      it "displays username field" do
        expect(page).to have_selector("label", text: I18n.t('common.username'))
        expect(page).to have_field("username")
      end

      it "displays password field" do
        expect(page).to have_selector("label", text: I18n.t('common.password'))
        expect(page).to have_field("user_entered_password")
      end

      it "displays password confirmation field" do
        expect(page).to have_selector("label", text: I18n.t('common.password_confirmation'))
        expect(page).to have_field("user_entered_password_confirmation")
      end

      it "displays email field" do
        expect(page).to have_selector("label", text: I18n.t('common.email'))
        expect(page).to have_field("user_email")
      end

      it "displays email confirmation field" do
        expect(page).to have_selector("label", text: I18n.t('common.email_confirmation'))
        expect(page).to have_field("user_email_confirmation")
      end

      it "displays real name field" do
        expect(page).to have_selector("label", text: I18n.t('common.real_name'))
        expect(page).to have_field("user_real_name")
      end

      it "displays recaptcha field" do
        expect(page).to have_selector("label", text: I18n.t('common.recaptcha'))
      end

      it "displays upload photo field" do
        expect(page).to have_selector("label", text: I18n.t('common.upload_photo'))
        expect(page).to have_field("photo_name")
      end
    end
  end

  describe "login" do

    before do
      visit login_users_path(locale: I18n.locale)
    end

    describe "new user form" do

      it "displays username field" do
        expect(page).to have_selector("label", text: I18n.t('common.username'))
        expect(page).to have_field("username")
      end

      it "displays password field" do
        expect(page).to have_selector("label", text: I18n.t('common.password'))
        expect(page).to have_field("password")
      end

      it "displays a link for forgot password page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/forgot_password']", text: I18n.t('common.forgot_password_link'))
      end

      it "displays a link for sign up page" do
        expect(page).to have_selector("a[href='/#{I18n.locale}/users/new']", text: I18n.t('common.signup'))
      end
    end
  end

  describe "show" do

    describe "profile tab" do

      context "when the user access his page" do

        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user)
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @owner_user.id)
        end

        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @owner_user.real_name)
        end

        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: @owner_user.username)
        end

        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @owner_user.created_at)
        end

        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @owner_user.last_login)
        end

        # cannot test this part because it uses ajax
        it "displays user photo"
        it "displays checkbox to delete user photo"

        it "displays an edit link for user profile" do
          expect(page).to have_selector("a[href='/#{I18n.locale}/users/#{@owner_user.id}/edit']", text: I18n.t('common.edit'))
        end
      end

      context "when the user access another user's page" do

        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user)
          @other_user = FactoryGirl.create(:user)
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @other_user.id)
        end

        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @other_user.real_name)
        end

        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: @other_user.username)
        end

        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @other_user.created_at)
        end

        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @other_user.last_login)
        end
      end
    end

    describe "collection tab" do

      before do
        @owner_user = FactoryGirl.create(:user, active: true, username: "owneruser",
                                         password: User.hash_password("owner_user_password"))
        @other_user = FactoryGirl.create(:user, active: true, username: "otheruser",
                                         password: User.hash_password("other_user_password"))
        @owner_private_collection = FactoryGirl.create(:collection, user_id: @owner_user.id, is_public: false)
        @owner_public_collection = FactoryGirl.create(:collection, user_id: @owner_user.id, is_public: true)
        @other_private_collection = FactoryGirl.create(:collection, user_id: @other_user.id, is_public: false)
        @other_public_collection = FactoryGirl.create(:collection, user_id: @other_user.id, is_public: true)
        page.set_rack_session(user_id: @owner_user.id)
      end

      it "should list current user's collections " do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector("span[class='badge']", text: Collection.user_collections(@owner_user).size)
      end

      it "should list public collections of other user" do
        visit user_path(id: @other_user.id, tab: "collections")
        expect(page).to have_selector("span[class='badge']", text: Collection.public_user_collections(@other_user).size)
      end

      it "should have an open link for public collections of other user" do
        visit user_path(id: @other_user.id, tab: "collections")
        expect(page).to have_selector("a[href= '/en/collections/#{@other_public_collection.id}']", text: @other_public_collection.title)
      end

      it "should have an open link for each collection of my collections" do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector("a[href = '/en/collections/#{@owner_private_collection.id}']", text: @owner_private_collection.title)
        expect(page).to have_selector("a[href = '/en/collections/#{@owner_public_collection.id}']", text: @owner_public_collection.title)
      end

      it "should have an image for each collection" do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector("img[src = '/assets/images_#{I18n.locale}/#{I18n.t('common.default_collection')}']")
      end

      it "should have added on date in my collections" do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector('small', text: @owner_private_collection.created_at)
        expect(page).to have_selector('small', text: @owner_public_collection.created_at)
      end

      it "should have delete link for the collections owned by the current user" do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector("a[href = '/en/collections/remove_collection?id=#{@owner_private_collection.id}&page=1&user_id=#{@owner_user.id}']")
        expect(page).to have_selector("a[href = '/en/collections/remove_collection?id=#{@owner_public_collection.id}&page=1&user_id=#{@owner_user.id}']")
      end

      it "should have added on date in other user collections" do
        visit user_path(id: @other_user.id, tab: "collections")
        expect(page).to have_selector('small', text: @other_public_collection.created_at)
      end

      it "should detail link for each collection in my collections" do
        visit user_path(id: @owner_user.id, tab: "collections")
        expect(page).to have_selector("a[href = '/en/collections/#{@owner_private_collection.id}']")
        expect(page).to have_selector("a[href = '/en/collections/#{@owner_public_collection.id}']")
      end

      it "should detail link for each collection in other user collections" do
        visit user_path(id: @other_user.id, tab: "collections")
        expect(page).to have_selector("a[href = '/en/collections/#{@other_public_collection.id}']")
      end

      context "many collections" do
        before do
          20.times do
            FactoryGirl.create(:collection, user_id: @other_user.id, is_public: true)
          end
        end

        it "should have pagination bar" do
          visit user_path(id: @other_user.id, tab: "collections")
          expect(page).to have_selector("div[class='pagination']")
        end
      end
    end


    describe "activity_tab" do
        before do
           book = FactoryGirl.create(:book, title: "new_book")
           @volume = FactoryGirl.create(:volume, book_id: book.id)
           comment = FactoryGirl.create(:comment, text: "main_comment")
           file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
           @owner_user = FactoryGirl.create(:user)
           @collection_create = FactoryGirl.create(:collection, user_id: @owner_user.id, title: "new_collection", is_public: true)
           @collection_rate = FactoryGirl.create(:rate, user_id: @owner_user.id , rateable_id: @collection_create.id , rateable_type: "collection",
                                                  rate: 5 )
           @collection_comment = FactoryGirl.create(:comment, commentable_id: @collection_create.id,commentable_type: "collection",
                                                  user_id: @owner_user.id, text: "Good_Collection")
           @volume_comment = FactoryGirl.create(:comment, commentable_id: @volume.job_id,  commentable_type: "volume", user_id: @owner_user.id,
                                                  text: "Good_volume")
           @volume_rate = FactoryGirl.create(:rate, user_id: @owner_user.id , rateable_id: @volume.job_id ,rateable_type: "volume",
                                                  rate: 5 )
           @reply_comment = FactoryGirl.create(:comment, commentable_id: comment.id,
                                                  commentable_type: "comment", user_id: @owner_user.id, text: "Reply")
           page.set_rack_session(user_id: @owner_user.id)
           visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "activity")
        end

        it "should display total number of activities" do
           expect(page).to have_selector("span[class='badge']", text: Activity.where(user_id: @owner_user.id).count  )
        end

        it "should display name of owner of activity" do
           expect(page).to have_selector("a[href='/#{I18n.locale}/users/#{@owner_user.id}?tab=profile']", text: "#{@owner_user.real_name}")
        end

         it "should display  open link of activity component" do
           expect(page).to have_selector("a[href= '/collections/#{@collection_create.id}']", text: "#{@collection_create.title}")
           expect(page).to have_selector("a[href= '/books/#{@volume.job_id}']")
         end

        it "should have pagination bar" do
           20.times {Collection.create(:user_id => @owner_user.id, :title => "other collection",:description => "description", :is_public => true)}
           visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "activity")
           expect(page).to have_selector("div[class='pagination']")
       end
    end

     describe "queries tab" do
      before do
          @user = FactoryGirl.create(:user, active: true, username: "@ouser", password: User.hash_password("@user_password"),
                                     real_name: "@user_real", email: "user@example.com")
          @other_user = FactoryGirl.create(:user, active: true, username: "@other_user", password: User.hash_password("@other_user_password"),
                                     real_name: "@other_user_real", email: "other_user@example.com")
          @query_first = Query.create(user_id: @user.id, string: "_title=popular")
          @query_second = Query.create(user_id: @user.id, string: "_content=smith")
          FactoryGirl.create(:language)
      end
      context "user with queries"do
          before do
            page.set_rack_session(user_id: @user.id)
            visit user_path(locale: I18n.locale, id: @user.id, tab: "queries")
          end
          it "displays total number of saved queries" do
            expect(page).to have_selector("span[class='badge']", text: 2)
          end

          it "contains query content body" do
            expect(page).to have_selector("b", text: "Title")
          end

          it "contains show result link for query" do
            expect(page).to have_selector("a[href= '/books?_title=popular']", text: "#{I18n.t('common.book_count', count:get_number_of_returned_books(@query_first.string).to_i)}")
            expect(page).to have_selector("a[href='/books?_content=smith']",  text: "#{I18n.t('common.book_count', count:get_number_of_returned_books(@query_second.string).to_i)}")
          end

          it " contains delete link for each query" do
            expect(page).to have_selector("a[href='/en/user_search_history/delete_query?id=#{@query_first.id}&user_id=#{@user.id}']")
            expect(page).to have_selector("a[href='/en/user_search_history/delete_query?id=#{@query_second.id}&user_id=#{@user.id}']")
          end

          it "should have pagination bar" do
            20.times {Query.create( user_id: @user.id, string: "_title=popular")}
            visit user_path(locale: I18n.locale, id: @user.id, tab: "queries")
            expect(page).to have_selector("div[class='pagination']")
          end
      end

      context "user with no queries" do
          before do
            page.set_rack_session(user_id: @other_user.id)
            visit user_path(id: @other_user, tab: "queries")
          end
          it "displays a msg of no queries found" do
            expect(page).to have_selector("h4", text:  I18n.t('common.no_queries_found'))
          end
          it "doesn't display any queries" do
            expect(page).not_to have_selector("div[class='col-md-8 column']")
          end
      end
   end

    describe "history tab" do

      context "when the user access his page" do

        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user)
          #adjust solr
          book_metadata_1 = {job_id: "123", bib_id: "456", title_en: "Book 1", author_en: "Author1", publisher_en: "publisher1",
            subject_en: "subject1", language_facet: "eng" }
          book_metadata_2 = {job_id: "234", bib_id: "567", title_en: "Book 2", author_en: "Author2", publisher_en: "publisher2",
            subject_en: "subject2", language_facet: "eng" }
          solr = RSolr.connect url: SOLR_BOOKS_METADATA
          solr.add book_metadata_1
          solr.add book_metadata_2
          solr.commit

          UserVolumeHistory.where(user_id: @owner_user.id).destroy_all
          @vol_first = Volume.create(book: Book.create(title: 'Book 1', bib_id: '456'), job_id: "123")
          @vol_second = Volume.create(book: Book.create(title: 'Book 2', bib_id: '567'), job_id: "234")
          @user_volume_history = UserVolumeHistory.create(volume_id: @vol_first.job_id, user_id: @owner_user.id, updated_at: Time.now)
          UserVolumeHistory.create(volume_id: @vol_second.job_id, user_id: @owner_user.id, updated_at: Time.now)
        end

        context "logged in user" do
          before do
            page.set_rack_session(user_id: @owner_user.id)
            visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "history")
          end

          it "should display last visited date" do
            expect(page).to have_selector("small", text: "#{(@user_volume_history).updated_at}")
          end

          it "should have item count equal to the total number of books" do
            expect(page).to have_selector("span[class='badge']", text: UserVolumeHistory.where(user_id: @owner_user.id).count)
          end

          it "should have book title that links for details" do
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_first.job_id}']")
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_second.job_id}']")
          end

          it "should have details link for each book" do
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_first.job_id}']", text: I18n.t('common.details'))
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_second.job_id}']", text: I18n.t('common.details'))
          end

          it "should have read link for each book" do
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_first.job_id}?tab=read']")
            expect(page).to have_selector("a[href= '/#{I18n.locale}/books/#{@vol_second.job_id}?tab=read']")
          end

        end

        context "not logged in user" do
          before do
            visit user_path(locale: I18n.locale, id: @owner_user.id, tab: "history")
          end

          it "should redirect to login page" do
            expect(page).to have_field("username")
            expect(page).to have_field("password")
          end
        end

      end

      context "when the user access another user's page" do

        before do
          file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join("spec/avatar/default_user.png")),
                                                        filename: File.basename(File.new(Rails.root.join("spec/avatar/default_user.png"))))
          @owner_user = FactoryGirl.create(:user)
          @other_user = FactoryGirl.create(:user)
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(locale: I18n.locale, id: @other_user.id)
        end

        it "displays real name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.real_name'))
          expect(page).to have_selector("span", text: @other_user.real_name)
        end

        it "displays user name of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.username'))
          expect(page).to have_selector("span", text: "#{@other_user.username}")
        end

        it "displays registeration date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.member_since'))
          expect(page).to have_selector("span", text: @other_user.created_at)
        end

        it "displays last login date of user" do
          expect(page).to have_selector("strong", text: I18n.t('common.last_login'))
          expect(page).to have_selector("span", text: @other_user.last_login)
        end
      end
    end

    describe "annotations tab" do
      before do
        @owner_user = FactoryGirl.create(:user)
        @other_user = FactoryGirl.create(:user)
        @books = [FactoryGirl.create(:book), FactoryGirl.create(:book)]
        solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
        solr_books_core.delete_by_query('*:*')
        solr_books_core.commit
        @job_ids = [9,20]
        @job_ids.each_with_index do |job_id, i|
          solr_books_core.add({ job_id: job_id, language_facet: 'English',
             bib_id: 'bib_id_#{i}', title_en: @books[i].title, author_en: "author_#{i}"})
        end
        solr_books_core.commit
        4.times do
          @job_ids.each do |job_id|
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Note", volume_id: job_id)
          end
        end
        6.times do
          @job_ids.each do |job_id|
            FactoryGirl.create(:annotation, user_id: @owner_user.id,
             anntype: "Highlight", volume_id: job_id)
          end
        end
      end
      context "user with annotations" do
        before do
          page.set_rack_session(user_id: @owner_user.id)
          visit user_path(id: @owner_user, tab: "annotations")
        end
        it 'displays annotations title' do
          expect(page).to have_selector("h4", text: I18n.t('annotations.title') )
        end
        it "displays the correct total number" do
          expect(page).to have_selector("span[id='total_number']", text: 20 )
        end
        it 'displays all the anotatted books' do
          expect(page).to have_selector("div[class='annotation clearfix']", count: 2)
        end
        it "displays the tile of each annotated book" do
          @books.each do |book|
            expect(page).to have_selector("h4",text: book.title)
          end
        end
        it ' displays the correct notes and highlights numbers' do
          expect(page).to have_selector("span[id='notes']", text: 4, count: 2)
          expect(page).to have_selector("span[id='highlights']", text: 6, count: 2)
        end
        it "has a details link for each annotated book" do
          @job_ids.each do |job_id|
            expect(page).to have_selector("a[href='#{book_path(id:job_id)}']", text: I18n.t('common.details'))
          end
        end
        it "has a read link for each annotated book" do
          @job_ids.each do |job_id|
            expect(page).to have_selector("a[href='#{book_path(id: job_id, tab: "read")}']", text: I18n.t('common.read'))
          end
        end
      end
      context "user with no annotations" do
        before do
          page.set_rack_session(user_id: @other_user.id)
          visit user_path(id: @other_user, tab: "annotations")
        end
        it "displays a msg of no annotations found" do
          expect(page).to have_selector("h4", text:  I18n.t('annotations.no_annotations_found'))
        end
        it "doesn't display any anottated books" do
          expect(page).not_to have_selector("div[class='annotation clearfix']")
        end
      end
    end
  end

  describe "edit" do
    let(:user) {FactoryGirl.create(:user)}

    before do
       page.set_rack_session(user_id: user.id)
       visit edit_user_path(locale: I18n.locale, id: user.id)
    end

    describe "edit user form" do

      it "displays username field" do
        expect(page).to have_selector("label", text: I18n.t('common.username'))
        expect(page).to have_field("username")
      end
      it "displays change password link" do
         expect(page).to have_selector("a[id='change_password']")
      end

      it "displays email field" do
        expect(page).to have_selector("label", text: I18n.t('common.email'))
        expect(page).to have_field("user_email")
      end

      it "displays email confirmation field" do
        expect(page).to have_selector("label", text: I18n.t('common.email_confirmation'))
        expect(page).to have_field("user_email_confirmation")
      end

      it "displays real name field" do
        expect(page).to have_selector("label", text: I18n.t('common.real_name'))
        expect(page).to have_field("user_real_name")
      end

      it "displays upload photo field" do
        expect(page).to have_selector("label", text: I18n.t('common.upload_photo'))
        expect(page).to have_field("photo_name")
      end

      describe "change password link" do

          it "displays old password field"
          it "displays new password field"
          it "displays new password confirmation field"
      end
    end
  end
end

