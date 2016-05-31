require 'rails_helper'
require_relative '../../lib/bhl/login'


RSpec.describe BooksController, type: :controller do

  include BHL::Login

  describe 'books autocomplete' do
    before(:all) do
      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({job_id: 1, language_facet: 'English', bib_id: 'bib_id', title_en: 'title_1',
                           author_en: 'author_1', subject_en: 'subject_1'})
      solr_books_core.add({job_id: 2, language_facet: 'English', bib_id: 'bib_id_2', title_en: 'title_2',
                           author_en: 'author_2', subject_en: 'subject_2'})
      solr_books_core.commit

      solr_books_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ sci_name: 'name_1' })
      solr_books_core.add({ sci_name: 'name_2' })
      solr_books_core.commit
    end

    describe 'title autocomplete' do
      context 'when result found' do
        it 'returns a list of titles matching the entered title' do
          get :autocomplete, type: 'title', term: 'tit'
          expect(assigns(:results)).to eq(['title_1', 'title_2'])
        end
      end

      context 'when no result found' do
        it 'returns no suggestions when no result found' do
          get :autocomplete, type: 'title', term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end

    describe 'author autocomplete' do
      context 'when result found' do
        it 'returns a list of authors matching the entered author' do
          get :autocomplete, type: 'author', term: 'auth'
          expect(assigns(:results)).to eq(['author_1', 'author_2'])
        end
      end

      context 'when no result found' do
        it 'returns no suggestions when no result found' do
          get :autocomplete, type: 'author', term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end

    describe 'subject autocomplete' do
      context 'when result found' do
        it 'returns a list of subjects matching the entered subject' do
          get :autocomplete, type: 'subject', term: 'subj'
          expect(assigns(:results)).to eq(['subject_1', 'subject_2'])
        end
      end

      context 'when no result found' do
        it 'returns no suggestions when no result found' do
          get :autocomplete, type: 'subject', term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end

    describe 'names autocomplete' do
      context 'when result found' do
        it 'returns a list of names matching the entered name' do
          get :autocomplete, type: 'name', term: 'nam'
          expect(assigns(:results)).to eq(['name_1', 'name_2'])
        end
      end

      context 'when no result found' do
        it 'returns no suggestions when no result found' do
          get :autocomplete, type: 'name', term: 'book'
          expect(assigns(:results)).to eq([I18n.t('msgs.no_suggestion')])
        end
      end
    end
  end

  describe 'index' do


    before(:all) do

      Language.create(code: 'en', name: 'English')

      Rails.cache.clear
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({job_id: 1, language_facet: 'English', bib_id: 'bib_id', title_en: 'title_1',
                           author_en: 'author_1', subject_en: 'subject_1', publisher_en: 'publisher_1',
                           location_search: 'location_1', rate: 5, views: 2  })
      solr_books_core.add({job_id: 2, language_facet: 'English', bib_id: 'bib_id_2', title_en: 'title_2',
                           author_en: 'author_2', subject_en: 'subject_2', publisher_en: 'publisher_2',
                           location_search: 'location_2', rate: 3, views: 3 })
      solr_books_core.commit

      solr_books_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ sci_name: 'sci_name_1' })
      solr_books_core.add({ sci_name: 'sci_name_2' })
      solr_books_core.commit

      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit
      solr_names_found_core.add({ job_id: 2, sci_name: 'sci_name_2', page: 1, name_found: 'name_2' })
      solr_names_found_core.add({ job_id: 1, sci_name: 'sci_name_1', page: 1, name_found: 'name_1' })
      solr_names_found_core.commit

    end

    it 'returns a 200 ok status' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template partial' do
      get :index
      expect(response).to render_template(:index)
    end

     it 'lists all books' do
      books_list = [{title: ['title_1'], author: ['author_1'], subject: ['subject_1'], rate: 5.0,
                     views: 2, job_id: 1, date: nil, sci_names: ['sci_name_1'], language: ['English'],
                     location: ['location_1'], publisher: ['publisher_1'], sci_names_count: 1 },
                    {title: ['title_2'], author: ['author_2'], subject: ['subject_2'], rate: 3.0,
                     views: 3, job_id: 2, date: nil, sci_names: ['sci_name_2'], language: ['English'],
                     location: ['location_2'], publisher: ['publisher_2'], sci_names_count: 1 }]
      get :index
      expect(assigns(:books)).to eq(books_list)
    end

    describe 'books search' do
      let(:books_list) {[{title: ['title_1'], author: ['author_1'], subject: ['subject_1'], rate: 5.0,
                          views: 2, job_id: 1, date: nil, sci_names: ['sci_name_1'], language: ['English'],
                          location: ['location_1'], publisher: ['publisher_1'], sci_names_count: 1 }]}

      let(:two_books_list) {[{title: ['title_1'], author: ['author_1'], subject: ['subject_1'], rate: 5.0,
                              views: 2, job_id: 1, date: nil, sci_names: ['sci_name_1'], language: ['English'],
                              location: ['location_1'], publisher: ['publisher_1'], sci_names_count: 1 },
                            {title: ['title_2'], author: ['author_2'], subject: ['subject_2'], rate: 3.0,
                             views: 3, job_id: 2, date: nil, sci_names: ['sci_name_2'], language: ['English'],
                             location: ['location_2'], publisher: ['publisher_2'], sci_names_count: 1 }]}

      it 'filters books by title' do
        get :index, {'_title' => 'title_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by author' do
        get :index, {'_author' => 'author_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by subject' do
        get :index, {'_subject' => 'subject_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by publisher' do
        get :index, {'_publisher' => 'publisher_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by location' do
        get :index, {'_location' => 'location_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by language' do
        get :index, {'_language' => 'English'}
        expect(assigns(:books)).to eq(two_books_list)
      end

      it 'filters books by name' do
        get :index, {'_name' => 'sci_name_1'}
        expect(assigns(:books)).to eq(books_list)
      end

      it 'filters books by content'

      it 'searches in all metada'
    end

    describe 'sort books' do
      let(:two_books_list) {[{title: ['title_1'], author: ['author_1'], subject: ['subject_1'], rate: 5.0,
                              views: 2, job_id: 1, date: nil, sci_names: ['sci_name_1'], language: ['English'],
                              location: ['location_1'], publisher: ['publisher_1'], sci_names_count: 1 },
                             {title: ['title_2'], author: ['author_2'], subject: ['subject_2'], rate: 3.0,
                              views: 3, job_id: 2, date: nil, sci_names: ['sci_name_2'], language: ['English'],
                              location: ['location_2'], publisher: ['publisher_2'], sci_names_count: 1 }]}

      context ' rate' do
        it 'sort books by rate DESC' do
          get :index, {'sort_type' => 'rate DESC'}
          expect(assigns(:books)).to eq(two_books_list.sort_by{ |book| book[:rate] }.reverse)
        end

        it 'sort books by rate ASC' do
          get :index, {'sort_type' => 'rate ASC'}
          expect(assigns(:books)).to eq(two_books_list.sort_by{ |book| book[:rate] })
        end
      end

      context 'number of views' do

        it 'sort books by number of views DESC' do
          get :index, {'sort_type' => 'views DESC'}
          expect(assigns(:books)).to eq(two_books_list.sort_by{ |book| book[:views] }.reverse)
        end

        it 'sort books by number of views ASC' do
          get :index, {'sort_type' => 'views ASC'}
          expect(assigns(:books)).to eq(two_books_list.sort_by{ |book| book[:views] })
        end
      end

      context 'book title'
    end
  end

  describe 'show' do
    before(:all) do
      @volume = FactoryGirl.create(:volume)
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
      solr_books_core.add({ job_id: @volume.id, views: 0, language_facet: 'English',
                            bib_id: 'bib_id', title_en: 'title_1', author_en: 'author_1',
                            subject_en: 'subject_1'})
      solr_books_core.commit
      Rails.cache.clear
    end
    it 'returns a 200 ok status' do
      get :show, { id: @volume.id }
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template partial' do
      get :show, { id: @volume.id }
      expect(response).to render_template(:show)
    end

    describe 'add_book_to_collection' do
      context 'when user is logged in' do
        it 'displays a link for add book to collection' do
          user = FactoryGirl.create(:user, password: User.hash_password('add_book_to_password'), active: true)
          log_out
          log_in(user)
          get :show, { id: @volume.id }
          expect(response.body).to have_selector('a', text: I18n.t('common.add_collection'))
          log_out
        end
      end

      context 'when user is not logged in' do
        it 'displays a link for add book to collection' do
          get :show, { id: @volume.id }
          expect(response.body).not_to have_selector('a', text: I18n.t('common.add_collection'))
        end
      end
    end

    describe 'read tab' do
      describe 'add_book_to_collection' do
        context 'when user is logged in' do
          it 'displays a link for add book to collection' do
            FactoryGirl.create(:user, password: User.hash_password('add_book_to_password'), active: true) unless User.first
            user = User.first
            log_out
            log_in(user)
            get :show, { id: @volume.id, tab: 'read'}
            expect(response.body).to have_selector('a', text: I18n.t('common.add_collection'))
            log_out
          end
        end

        context 'when user is not logged in' do
          it 'displays a link for add book to collection' do
            get :show, { id: @volume.id, tab: 'read'}
            expect(response.body).not_to have_selector('a', text: I18n.t('common.add_collection'))
          end
        end
      end

      it 'adds record in history table when visit read tab' do
        FactoryGirl.create(:user, password: User.hash_password('add_book_to_password'), active: true) unless User.first
        user = User.first
        log_out
        log_in(user)
        UserVolumeHistory.where(user_id: user.id, volume_id: @volume.id).destroy_all unless UserVolumeHistory.where(user_id: user.id, volume_id: @volume.id).nil?
        user_history_count = UserVolumeHistory.where(user_id: user.id).count
        get :show, { id: @volume.id, tab: 'read'}
        expect(UserVolumeHistory.where(user_id: user.id).count).to eq(user_history_count + 1)
      end
    end
  end
end