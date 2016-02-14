require Rails.root.join('lib', 'load_status.rb')

namespace :status do
  desc "fill databse with statuses lookup table"
  task :load => :environment do
    raise "ONLY available in the development and test environments" unless
      Rails.env.development? || Rails.env.test?
      Loader::StatusLoader.load_status    
  end
end