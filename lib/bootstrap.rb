require 'faker'
require Rails.root.join('app/helpers', 'hadoop_helper.rb')

include HadoopHelper

module SAMPLDATA
  # Should only be used in development and test (if needed)
  class Ingestion
    def self.fill_db_with_sample_data
      DatabaseCleaner.clean_with :truncation

      ["Pending metadata", "Finished metadata"].each do |status|
        BookStatus.create(status_code: status)
      end
      
      ["Pending content", "Pending indexing", "Indexed"].each do |status|
        BatchStatus.create(status_code: status)
      end

      ingest_metadata_from_xml_string(File.open("lib/assets/BHL-Meta_sample2.xml"))

      10.times do |n|
        source_volume = Volume.includes(:book).find(n + 1)
        dest_volume = Volume.includes(:book).find(rand(n + 2..Volume.count))
        unless source_volume.book.title.nil? || dest_volume.book.title.nil?
          BookView.create(source_book_id: source_volume.job_id,
                          dest_book_id: dest_volume.job_id)
        end
      end

      5.times do |n|
        User.create(username: "user_#{n}",
                    password: User.hash_password('password'),
                    email: "#{n}#{Faker::Internet.email}",
                    guid: "#{n}#{Faker::Lorem.characters(15)}",
                    real_name: "user_real_name_#{n}",
                    active: true)
      end

      5.times do |n|
        rand(3).times do |m|
          UserVolumeHistory.create(user_id: n + 1,
                                   volume_id: Volume.find(m + 1).job_id,
                                   total_number_of_views: rand(5))
        end
      end

      5.times do |n|
        rand(2).times do |m|
          Query.create(user_id: n + 1, string: "_title=search#{n}#{m}")
        end
      end

      5.times do |n|
        Comment.create(commentable_id: Volume.find(rand(1..Volume.count)).job_id,
                       commentable_type: 'volume',
                       user_id: rand(1..User.count),
                       number_of_marks: n,
                       text: "text_volume_#{n}")
      end

      5.times do
        Rate.create(rateable_id: Volume.find(rand(1..Volume.count)).job_id,
                    rateable_type: 'volume',
                    user_id: rand(1..User.count),
                    rate: rand(5))
      end

      5.times do |n|
        public_collection_n = Collection.create(title: "title_public_#{n}",
                                                description: "description_#{n}",
                                                is_public: true,
                                                user_id: User.find(n + 1).id)
        private_collection_n = Collection.create(title: "title_private_#{n}",
                                                 description: "description_#{n}",
                                                 is_public: false,
                                                 user_id: User.find(n + 1).id)
        CollectionVolume.create(collection_id: public_collection_n.id,
                                volume_id: Volume.find(rand(1..Volume.count)).job_id)
        CollectionVolume.create(collection_id: private_collection_n.id,
                                volume_id: Volume.find(rand(1..Volume.count)).job_id)
        rand(User.count).times do |m|
          rate_value = rand(5)
          Rate.create(rateable_id: public_collection_n.id,
                      rateable_type: 'collection',
                      user_id: m + 1,
                      rate: rate_value)
          Comment.create(commentable_id: public_collection_n.id,
                         commentable_type: 'collection',
                         user_id: m + 1,
                         number_of_marks: m, text: "good_collection_#{n}")
        end

        public_collection_n.update_attributes(rate: Rate.where(rateable_id: public_collection_n.id, rateable_type: "collection").average('rate').to_f)
      end

      location = Location.find(3)
      location.update_attributes(longitude: 80.2707,latitude: 13.0827, formatted_address: "Chennai, Tamil Nadu, India")

      insert_sample_names
    end

    def self.insert_sample_names
      File.open("lib/assets/namesSample", "r") do |f|
        f.each_line do |line|
          tokens = line.split("###")
          volume_and_page = tokens[0].split("-")
          job_id = volume_and_page[0]
          page = volume_and_page[1]
          tokens[1].split("#=#").each do |name_token|
            temp = name_token.split("#\@#")
            name_found = temp[0]
            sci_name = temp[1]
            name = Name.find_or_create_by(sci_name: sci_name)
            VolumeName.create(volume_id: job_id, page_number: page, name_found: name_found, name_id: name.id)
          end
        end
      end
    end
  end
end
