require Rails.root.join('lib', 'bootstrap.rb')
require Rails.root.join('lib', 'solr_index.rb')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
SAMPLDATA::Ingestion.fill_db_with_sample_data
SOLR::Indexer.fill_solr_with_sample_data
