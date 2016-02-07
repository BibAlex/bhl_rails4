require Rails.root.join('lib', 'bootstrap.rb')
require Rails.root.join('lib', 'solr_index.rb')

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    raise "ONLY available in the development and test environments" unless
      Rails.env.development? || Rails.env.test?

    SAMPLDATA::Ingestion.fill_db_with_sample_data
    SOLR::Indexer.fill_solr_with_sample_data
  end

  desc 'Fill eol with sample data'
  task :import_eol_sample_data => :environment do
    raise "ONLY available in the development and test environments" unless
      Rails.env.development? || Rails.env.test?

    # Switch connection to eol
    connection = ActiveRecord::Base.establish_connection(:eol).connection

    puts "Delete all tables"
    tables = connection.execute("show tables").map { |r| r[0] }
    tables.each do |t|
      connection.execute("drop tables #{t};")
    end

    puts "Loading db dump"
    conf = Rails.configuration.database_configuration["eol"]
    system("mysql -u #{conf['username']} -p#{conf['password']} #{conf['database']} < db/eol_dump.sql");
  end
end