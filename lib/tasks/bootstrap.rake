require Rails.root.join('lib', 'bootstrap.rb')
require Rails.root.join('lib', 'solr_index.rb')

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    SAMPLDATA::Ingestion.fill_db_with_sample_data
    SOLR::Indexer.fill_solr_with_sample_data
  end
end