require 'rails_helper'
include BHL::Login

RSpec.describe UsersController, type: :controller do

  describe '#new' do

    it 'expect to redirect on regular http call' do
      get :new
      expect(response).to have_http_status(:moved_permanently)
    end

    it 'returns a 200 ok status' do
      request.env['HTTPS'] = 'on'
      get :new
      expect(response).to have_http_status(:ok)
    end

    it 'renders the new template' do
      request.env['HTTPS'] = 'on'
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do

    context 'when user enters valid parameters' do

      before do
        request.env['HTTPS'] = 'on'

        @file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join('spec/avatar/default_user.png')),
                                                      filename: File.basename(File.new(Rails.root.join('spec/avatar/default_user.png'))))
        @user = { user: {username: 'username', entered_password: 'password123',
                         entered_password_confirmation: 'password123', email: 'user@example.com',
                         email_confirmation: 'user@example.com', real_name: 'user',
                         photo_name: @file } }
      end

      it 'creates new user' do
         expect {
          post :create, @user
         }.to change(User, :count).by(1)
      end

      it 'redirects to home page' do
        post :create, @user
        expect(response).to redirect_to(root_path)
      end

      it 'displays a flash message for successful registeration' do
        post :create, @user
        expect(flash[:notice]).to eq(I18n.t('msgs.registration_welcome_message', real_name: 'user'))
      end

      it 'uploads custom user photo' do
        post :create, @user
        expect(File.exist?("#{Rails.root}/public/avatar_#{Rails.env}/users/#{User.last.id}")).to eq(true)
        file_path = "#{Rails.root}/public/avatar_#{Rails.env}/users/#{User.last.id}"
        FileUtils.rm_rf(file_path) if File.exist?(file_path)
      end
    end

    context 'when user enters invalid parameters' do

      before do
        request.env['HTTPS'] = 'on'
        @user = { user: {username: '', entered_password: 'password123',
                         entered_password_confirmation: 'password123', email: 'user@example.com',
                         email_confirmation: 'user@example.com', real_name: 'user'} }
      end

      it "doesn't create a new user" do
         expect {
          post :create, @user
         }.to change(User, :count).by(0)
      end

      it 'renders redirects to new page' do
        post :create, @user
        expect(response).to redirect_to(new_user_path)
      end
    end
  end

  describe '#login' do

    before do
      request.env['HTTPS'] = 'on'
      get :login
    end

    it 'returns a 200 ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the login template' do
      expect(response).to render_template(:login)
    end
  end

  describe '#show' do

    before :all do
      @owner_user = FactoryGirl.create(:user)
    end

    context 'profile tab' do
      before do
        session[:user_id] = @owner_user.id
        get :show, { id: @owner_user.id }
      end

      it 'returns a 200 ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'loads user info' do
        expect(assigns(:user)).to eq(@owner_user)
      end

      it 'loads tab info' do
        expect(assigns(:tab)).to eq('profile')
      end
    end

    context 'queries tab' do
       let(:other_user) {FactoryGirl.create(:user, active: true, email: 'other_user@bibalex.org',
                                            username: 'other_user', password: User.hash_password('other_user_password'))}
      context 'owner user' do
        before do
          2.times {FactoryGirl.create(:query, user_id: @owner_user.id , string: '_genre=science')}
          session[:user_id] = @owner_user.id
          get :show, id: @owner_user.id, tab: 'queries'
        end
        context 'user has queries' do
          it 'loads successfully' do
            expect(response).to have_http_status(:ok)
          end
          it 'renders the show template' do
            expect(response).to render_template(:show)
          end
          it 'displays the right number of queries' do
            expect(@owner_user.queries.count).to eq(2)
          end
        end
        context 'user has no queries' do
          it 'loads successfully' do
            expect(response).to have_http_status(:ok)
          end
          it 'assigns zero queries for user' do
            expect(other_user.queries.count).to eq(0)
          end
        end
      end
      context 'other user' do
        before do
          session[:user_id] = other_user.id
          get :show , {id: @owner_user.id , tab: 'queries'}
        end
        it 'redirects to owner user profile' do
         expect(response).to redirect_to(user_path)
        end
        it 'displays access denied msg' do
         expect(flash[:error]).to eq(I18n.t 'msgs.access_denied_error')
        end
      end
    end
    context 'history tab' do

      context 'owner user' do

        before :all do
          book_metadata_1 = {job_id: '123', bib_id: '456', title_en: 'Book 1', author_en: 'Author1',
                             publisher_en: 'publisher1', subject_en: 'subject1'}
          book_metadata_2 = {job_id: '234', bib_id: '567', title_en: 'Book 2', author_en: 'Author2',
                             publisher_en: 'publisher2', subject_en: 'subject2'}

          solr = RSolr.connect :url => SOLR_BOOKS_METADATA

          solr.delete_by_query('*:*')
          # solr.delete_by_query("job_id: 234")
          solr.commit
          solr.add book_metadata_1
          solr.add book_metadata_2
          solr.commit

          UserVolumeHistory.where(user_id: @owner_user.id).destroy_all
          @vol_first = Volume.create(book: Book.create(title: 'Book 1', bib_id: '456'), job_id: '123')
          @vol_second = Volume.create(book: Book.create(title: 'Book 2', bib_id: '567'), job_id: '234')
          UserVolumeHistory.create(volume_id: @vol_first.id, user_id: @owner_user.id, :updated_at => Time.now)
          UserVolumeHistory.create(volume_id: @vol_second.id, user_id: @owner_user.id, :updated_at => Time.now)
        end

        it 'should have 2 total books' do
          session[:user_id] = @owner_user.id
          get :show, { id: @owner_user.id, tab: 'history'}
          expect(assigns[:total_number]).to eq(2)
        end

        it 'should have 1 recently viewed volume' do
          session[:user_id] = @owner_user.id
          get :show, { id: @owner_user.id, tab: 'history'}
          expect(assigns[:recently_viewed_volume]).to eq(@vol_first)
        end

      end

      context 'not owner user' do

        let!(:another_user) { FactoryGirl.create(:user, active: true, email: 'another_user_email@bibalex.org',
                                                 username: 'another_user',
                                                 password: User.hash_password('another_password')) }

        it 'should redirect to login if not logged in' do
          get :show, { id: @owner_user.id, tab: 'history' }
          expect(response).to redirect_to(login_users_path)
        end

        it 'should deny access for wrong user' do
          session[:user_id] = @owner_user.id
          get :show, { id: another_user.id, tab: 'history' }
          expect(response).to redirect_to(user_path(id: another_user.id))
        end
      end
    end

    context 'collection tab' do
      before do
        @other_user = FactoryGirl.create(:user, active: true, username: 'otheruser',
         password: User.hash_password('other_user_password'))
        @owner_private_collection = FactoryGirl.create(:collection, user_id: @owner_user.id, is_public: false)
        @owner_public_collection = FactoryGirl.create(:collection, user_id: @owner_user.id, is_public: true)
        @other_private_collection = FactoryGirl.create(:collection, user_id: @other_user.id, is_public: false)
        @other_public_collection = FactoryGirl.create(:collection, user_id: @other_user.id, is_public: true)
        log_in(@owner_user)
      end

      context 'owner user' do
        before do
          get :show, { id: @owner_user.id, tab: 'collections'}
        end

        it 'loads successfully' do
          expect(response).to have_http_status(:ok)
        end

        it 'should have 2 collections' do
          expect(assigns[:total_number]).to eq(2)
        end
      end

     context 'other user' do
       before do
         get :show, { id: @other_user.id, tab: 'collections'}
       end

       it 'loads successfully' do
         expect(response).to have_http_status(:ok)
       end

       it 'should have only 1 collection' do
         expect(assigns[:total_number]).to eq(1)
       end
     end
    end

    describe 'annotations tab' do
      before do
        @owner_user = FactoryGirl.create(:user, active: true, username: 'owneruser',
         password: User.hash_password('owner_user_password'))
        @other_user = FactoryGirl.create(:user, active: true,
                                         username: 'otheruser', password: User.hash_password('other_user_password'))
      end
      context 'successful' do
        before do
          book = FactoryGirl.create(:book)
          job_ids = [9,20]
          solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
          solr_books_core.delete_by_query('*:*')
          solr_books_core.commit
          job_ids.each_with_index do |job_id, i|
          solr_books_core.add({ job_id: job_id, language_facet: 'English',
             bib_id: 'bib_id_#{i}', title_en: book.title, author_en: "author_#{i}"})
           end
          solr_books_core.commit
          2.times do
            job_ids.each do |job_id|
              FactoryGirl.create(:annotation, user_id: @owner_user.id,
                                 anntype: 'Note', volume_id: job_id)
            end
          end
          3.times do
            job_ids.each do |job_id|
              FactoryGirl.create(:annotation, user_id: @owner_user.id,
                                 anntype: 'Highlight', volume_id: job_id)
            end
          end

        end
        context 'with user has annotations' do
          before do
            session[:user_id] = @owner_user.id
            get :show, id: @owner_user.id, tab: 'annotations'
          end
           it 'loads successfully' do
            expect(response).to have_http_status(:ok)
          end
          it 'loads the rights tab' do
            expect(assigns[:tab]).to eq('annotations')
          end
          it 'displays the right number for total annotations' do
            expect(assigns[:total_number]).to eq(10)
          end
        end
        context 'user with no annotations' do
          before do
            session[:user_id] = @other_user.id
            get :show, id: @other_user.id, tab: 'annotations'
          end
           it 'loads successfully' do
            expect(response).to have_http_status(:ok)
          end
          it 'assigns zero annotations for the user' do
            expect(assigns[:total_number]).to eq(0)
          end
        end
      end
      context 'failure' do
        before do
          session[:user_id] = @other_user.id
          get :show, id: @owner_user.id, tab: 'annotations'
        end
        it "doesn't show the annotations tab" do
          expect(response).to redirect_to( user_path(id: @owner_user.id) )
        end
        it 'displays an access denied error' do
          expect(flash[:error]).to eq(I18n.t 'msgs.access_denied_error')
        end
      end
    end

    describe 'activity_log' do
      let!(:owner_user) { FactoryGirl.create(:user) }

    before do
      session[:user_id] = owner_user.id
      get :show, { id: @owner_user.id , tab: 'activity'}
    end

    it 'returns a 200 ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template(partial: 'users/_activity')
    end

    it 'loads tab info' do
      expect(assigns(:tab)).to eq('activity')
    end

  end
end



  describe '#logout' do

   let!(:user) { FactoryGirl.create(:user) }

    before do
      post :validate, { user: {username: 'user_logout', password: 'user_logout_password'} }
      get :logout, { id: user.id }
    end


    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'clears session of user_id' do
       expect(session[:user_id]).to be_nil
    end
  end

  describe '#forgot_password' do

    let!(:user) { FactoryGirl.create(:user, active: true, username: 'user', password: User.hash_password('password')) }

    it 'should not render forget_password if logged in' do
      session[:user_id] = user.id
      get :forgot_password
      expect(response).to redirect_to("/en/users/#{user.id}")
    end

    it 'should render forget password if not logged in' do
      get :forgot_password
      expect(response).to render_template('users/forgot_password')
    end
  end

  describe '#recover_password' do

    let!(:user) { FactoryGirl.create(:user, active: true, username: 'user', password: User.hash_password('password')) }

    it 'should not render recover_password if logged in' do
      session[:user_id] = user.id
      post :recover_password, { user: { email: ''} }
      expect(response).to redirect_to("/en/users/#{user.id}")
    end

    it 'should give an error and redirect to forgot password' do
      post :recover_password, { user: { email: '' } }
      expect(flash[:error]).not_to be_blank
      expect(response).to redirect_to('/users/forgot_password')
    end

    it 'should redirect to login' do
      post :recover_password, { user: { email: user.email } }
      expect(response).to redirect_to(login_users_path)
      expect(flash[:error]).to be_blank
    end

    it 'should change verification activation code if valid email' do
      old_verification_code = user.verification_code
      post :recover_password, { user: { email: user.email } }
      expect(response).to redirect_to('/users/login')
      user.reload #should reload the object to reflect the verfication_code changes
      expect(user.verification_code).not_to eq(old_verification_code)
    end
  end

  describe '#reset_password' do

    let!(:user) { FactoryGirl.create(:user, active: true, username: 'user', password: User.hash_password('password')) }

    it 'should redirect to profile page if user is logged in' do
      session[:user_id] = user.id
      request.env['HTTPS'] = 'on'
      get :reset_password, guid: user.guid, activation_code: user.verification_code
      expect(response).to redirect_to "/en/users/#{user.id}"
    end

    it 'should raise error and redirect to root if invalid parameters' do
      request.env['HTTPS'] = 'on'
      get :reset_password, guid: user.guid, activation_code: '1234'
      expect(response).to redirect_to '/'
      expect(flash[:error]).not_to be_blank
    end

    it 'should render form if parameters are valid' do
      request.env['HTTPS'] = 'on'
      get :reset_password, guid: user.guid, activation_code: user.verification_code
      expect(response).to render_template 'users/reset_password'
      expect(flash[:error]).to be_blank
    end
  end

  describe '#reset_password_action' do

    before do
      request.env['HTTPS'] = 'on'
    end

    let!(:user) { FactoryGirl.create(:user, active: true, username: 'user', password: User.hash_password('password')) }

    it 'should redirect to profile page if user is logged in' do
      session[:user_id] = user.id
      post :reset_password_action
      expect(response).to redirect_to "/en/users/#{user.id}"
    end

    it 'should redirect to home page if user is invalid' do
      post :reset_password_action, { user: { } }
      expect(response).to redirect_to '/'
    end

    it 'should redirect to home page if invalid parameters' do
      post :reset_password_action, { user: { guid: user.guid, activation_code: '1234'} }
      expect(response).to redirect_to '/'
      expect(flash[:error]).not_to be_blank
    end

    it 'should reject short passwords' do
      post :reset_password_action, { user: {
        guid: user.guid,
        activation_code: user.verification_code,
        entered_password: '123',
        entered_password_confirmation: '123'} }
      expect(response).to redirect_to "/users/reset_password/#{user.guid}/#{user.verification_code}"
      expect(flash[:error]).not_to be_blank
    end

    it 'should reject mismatched passwords' do
      post :reset_password_action, { user: {
        guid: user.guid,
        activation_code: user.verification_code,
        entered_password: '1234',
        entered_password_confirmation: '123456'} }
      expect(response).to redirect_to "/users/reset_password/#{user.guid}/#{user.verification_code}"
      expect(flash[:error]).not_to be_blank
    end

    it 'should change password and redirect to login' do
      old_password = user.password
      post :reset_password_action, { user: {
        guid: user.guid,
        activation_code: user.verification_code,
        entered_password: 'test1234',
        entered_password_confirmation: 'test1234'} }
      user.reload
      expect(user.password).not_to eq(old_password)
      expect(user.password).to eq(Digest::MD5.hexdigest('test1234'))
      expect(response).to redirect_to '/users/login'
    end
  end

  describe '#validate' do

    context 'valid user' do

      before do
        request.env['HTTPS'] = 'on'
      end

      let!(:user) { FactoryGirl.create(:user, active: true, username: 'valid_user_login', password: User.hash_password('password')) }

      it 'sets session of user_id' do
         post :validate, { user: { username: user.username, password: 'password'} }
         expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the profile page of the user' do
        post :validate, { user: { username: user.username, password: 'password'} }
        expect(response).to redirect_to(user_path(id: user.id))
      end

      it 'displays a flash message for successful login' do
        post :validate, { user: { username: user.username, password: 'password'} }
        expect(flash[:notice]).to eq(I18n.t('msgs.sign_in_successful_notice'))
      end
    end

    context 'invalid user' do

      before do
        request.env['HTTPS'] = 'on'
      end

      it 'sets session of login_attempts' do
        last_login_attempts = session[:login_attempts] ||= 0
        post :validate, { user: {username: 'invalid_username', password: 'invalid_password'} }
        expect(session[:login_attempts]).to eq(last_login_attempts + 1)
      end

      it 'renders renders login page' do
        post :validate, { user: {username: 'invalid_username', password: 'invalid_password'} }
        expect(response).to redirect_to(login_users_path)
      end

      it 'displays a flash message for unsuccessful login' do
        post :validate, { user: {username: 'invalid_username', password: 'invalid_password'} }
        expect(flash[:error]).to eq(I18n.t('msgs.sign_in_unsuccessful_error'))
      end


      it 'displays a flash message for inactive user login' do
        FactoryGirl.create(:user, active: false, username: 'valid_user_login', password: User.hash_password('password'))
        post :validate, { user: {username: 'valid_user_login', password: 'password'} }
        expect(flash[:error]).to eq(I18n.t('msgs.sign_in_inactive_user'))
      end
    end
  end

  describe '#edit' do
    let(:owner_user) {FactoryGirl.create(:user, active: true, email: 'owner_user@bibalex.org',
                                         username: 'owner_user', password: User.hash_password('owner_user_password'))}
    let(:other_user) {FactoryGirl.create(:user, active: true, email: 'other_user@bibalex.org',
                                         username: 'other_user', password: User.hash_password('other_user_password'))}

    it 'redirects to login if user not logged in' do
      get 'edit', id: owner_user.id
      expect(response).to redirect_to(login_users_path)
    end

    context 'other user' do
      before do
        session[:user_id] = owner_user.id
        get 'edit', id: other_user.id
      end

      it 'redirects to other user profile page' do
        expect(response).to redirect_to(user_path)
      end
      it 'displays access denied msg' do
        expect(flash[:error]).to eq(I18n.t 'msgs.access_denied_error')
      end
    end

    context 'owner user' do
       before do
         session[:user_id] = owner_user.id
         get 'edit', id: owner_user.id
       end

       it 'renders edit form' do
         expect(response).to render_template(:edit)
       end

       it 'has no error msgs' do
         expect(flash[:error]).to be_blank
       end
    end
  end

  describe '#update' do

      context 'owner user' do
         let(:owner_user) {FactoryGirl.create(:user, active: true, email: 'owner_user@bibalex.org',
                                              username: 'owner_user', password: User.hash_password('owner_user_password'))}



         it 'can upload valid photo' do
             user_before_update = owner_user
             log_in(owner_user)
             file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join('spec/avatar/default_user.png')),
                                                      filename: File.basename(File.new(Rails.root.join('spec/avatar/default_user.png'))))
             put :update, id: owner_user.id, test: true, user: {id: owner_user.id,
                                                                  username: user_before_update.username,
                                                                  email: user_before_update.email,
                                                                  email_confirmation: user_before_update.email,
                                                                  entered_password: nil,
                                                                  entered_password_confirmation: nil,
                                                                  real_name: user_before_update.real_name + 'updated',
                                                                  photo_name: file}
            owner_user.reload
            pic = owner_user.photo_name
            expect(File.exist?("#{Rails.root}/public/avatar_#{Rails.env}/users/#{owner_user.id}")).to eq(true)
            file_path = "#{Rails.root}/public/avatar_#{Rails.env}/users/#{owner_user.id}"
            FileUtils.rm_rf(file_path) if File.exist?(file_path)
         end

         it 'does not upload pictures with invalid extensions ' do
            user_before_update = owner_user
            log_in(owner_user)
            file = ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join('spec/rails_helper.rb')),
                                                      filename: File.basename(File.new(Rails.root.join('spec/rails_helper.rb'))))
            put :update, id: owner_user.id, test: true, user: {id: owner_user.id,
                                                                  username: user_before_update.username,
                                                                  email: user_before_update.email,
                                                                  email_confirmation: user_before_update.email,
                                                                  entered_password: nil,
                                                                  entered_password_confirmation: nil,
                                                                  real_name: user_before_update.real_name + 'updated',
                                                                  photo_name: file}
            owner_user.reload
            pic = owner_user.photo_name
            expect(File.exist?("#{Rails.root}/public/users/#{owner_user.id}/rails_helper")).to eq(false)
            file_path = "#{Rails.root}/public/users/#{owner_user.id}/rails_helper"
            FileUtils.rm_rf(file_path) if File.exist?(file_path)
         end

         it 'accepts modifications even if the password is empty' do
            user_before_update = owner_user

            log_in(owner_user)
            put :update, id: owner_user.id , user: {id: owner_user.id, username: user_before_update.username,
                                                    email: user_before_update.email,
                                                    email_confirmation: user_before_update.email,
                                                    entered_password: nil,
                                                    entered_password_confirmation: nil,
                                                    real_name: user_before_update.real_name + 'updated'}
            expect(response).to redirect_to user_path
            expect(flash[:error]).to be_blank
            expect(flash[:notice]).not_to be_blank

            owner_user.reload

            expect(owner_user.username).to eq(user_before_update.username)
            expect(owner_user.password).to eq(user_before_update.password)
            expect(owner_user.email).to eq(user_before_update.email)
            expect(owner_user.real_name).to eq(user_before_update.real_name)
            expect(session[:real_name]).to eq(owner_user.real_name)
         end

         it 'rejects modifications and renders edit for invalid old password' do
           #request.env['HTTPS'] = 'on'
           log_in(owner_user)
           put :update, id: owner_user.id , user: {id: owner_user.id, username: owner_user.username,
                                                   email: owner_user.email,
                                                   email_confirmation: owner_user.email,
                                                   old_password: 'wrong_pass',
                                                   entered_password: '123',
                                                   entered_password_confirmation: '123',
                                                   real_name: owner_user.real_name}

           expect(flash[:error]).to eq(I18n.t('msgs.invalid_old_password'))
         end

         it 'rejects modifications and renders edit without entering old password' do
           log_in(owner_user)
           put :update, id: owner_user.id , user: {id: owner_user.id, username: owner_user.username,
                                                   email: owner_user.email,
                                                   email_confirmation: owner_user.email,
                                                   old_password: nil,
                                                   entered_password: '123',
                                                   entered_password_confirmation: '123',
                                                   real_name: owner_user.real_name}

           expect(flash[:error]).to eq(I18n.t('msgs.old_password_required'))
         end
      end

      context 'other user' do
         let(:owner_user) {FactoryGirl.create(:user, active: true, email: 'owner_user@bibalex.org',
                                              username: 'owner_user', password: User.hash_password('owner_user_password'))}
         let(:other_user) {FactoryGirl.create(:user, active: true, email: 'other_user@bibalex.org',
                                              username: 'other_user', password: User.hash_password('other_user_password'))}

         it 'redirects to login page if user not logged in' do
            put :update, id: owner_user.id
            expect(response).to redirect_to(login_users_path)
         end
         it 'redirects to other user profile page' do
            log_in(owner_user)
            put :update, id: other_user.id
            expect(response).to redirect_to(user_path)
         end
         it 'displays access denied msg' do
            log_in(owner_user)
            put :update, id: other_user.id
            expect(flash[:error]).to eq(I18n.t 'msgs.access_denied_error')
         end
      end


  end
end

