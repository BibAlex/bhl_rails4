require 'factory_girl'
require "rack_session_access/capybara" 

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    require "#{Rails.root}/db/seeds.rb"
  end

  config.before(:each) do |example|
    # DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def clean_book_tables
  # Book.delete_all
  # Author.delete_all
  # Location.delete_all
  # Subject.delete_all
  # Volume.delete_all
end

def load_book_statuses
  # make sure that book_statuses table is populated
  BookStatus.delete_all
  ["Pending metadata", "Pending content", "Pending indexing", "Indexed"].each do |status|
    BookStatus.create(:status_code => status)
  end
end