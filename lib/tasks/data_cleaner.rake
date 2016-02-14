require Rails.root.join('lib', 'clean_db_and_solr.rb')

namespace :data do
  desc "clean database and solr"
  task :clean => :environment do
    raise "ONLY available in the development and test environments" unless
      Rails.env.development? || Rails.env.test?

    DataCleanser::DatabaseAndSolrCleaner.clean_db_and_solr
  end
end
