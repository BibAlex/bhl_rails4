require 'faker'
require Rails.root.join('app/helpers', 'hadoop_helper.rb')

include HadoopHelper

module SAMPLDATA
  class Ingestion
    
    def self.fill_db_with_sample_data
      
      DatabaseCleaner.clean_with :truncation
      
      ["Pending metadata", "Pending content", "Pending indexing", "Indexed"].each do |status|
        BookStatus.create(status_code: status)
      end
      
      ingest_metadata_from_xml_string(File.open("lib/assets/BHL-Meta_sample2.xml"))
      
      10.times do |n|
        source_volume = Volume.includes(:book).find(n+1)
        dest_volume = Volume.includes(:book).find(rand(n+2..Volume.count))
        BookView.create(source_book_id: source_volume.job_id, dest_book_id: dest_volume.job_id,
                        source_book_title: source_volume.book.title.split(",")[0], dest_book_title: dest_volume.book.title.split(",")[0])
      end
      
      5.times do |n|
        User.create(username: "#{n}#{Faker::Internet.user_name(4..15)}",
                    password: User.hash_password('password'), email: "#{n}#{Faker::Internet.email}",
                    guid: "#{n}#{Faker::Lorem.characters(15)}", real_name: "#{n}#{Faker::Name.first_name}", active: true)
      end
      
      5.times do |n|
        rand(3).times do |m|
          UserVolumeHistory.create(user_id: n+1, volume_id: m+1)
        end        
      end
      
      5.times do |n|
        rand(2).times do |m|
          Query.create(user_id: n+1, string: "_title=search#{n}#{m}")
        end        
      end
      
      5.times do |n|
        Comment.create(commentable_id: rand(Volume.count) , commentable_type:"volume", user_id: rand(User.count), number_of_marks: n, text: "text_volume_#{n}")
      end
      
      5.times do |n|
        public_collection_n = Collection.create(title: "title_public_#{n}", description: "description_#{n}", is_public: true, user_id: User.find(n+1).id)
        Activity.create(activitable_id: public_collection_n.id, action: "create", user_id: public_collection_n.user_id,
                        activitable_type: "collection", activitable_title: public_collection_n.title)
        private_collection_n = Collection.create(title: "title_private_#{n}", description: "description_#{n}", is_public: false, user_id: User.find(n+1).id)
        Activity.create(activitable_id: private_collection_n.id, action: "create", user_id: private_collection_n.user_id,
                        activitable_type: "collection", activitable_title: private_collection_n.title)
        CollectionVolume.create(collection_id: public_collection_n.id, volume_id: rand(Volume.count))
        CollectionVolume.create(collection_id: private_collection_n.id, volume_id: rand(Volume.count))
        rand(User.count).times do |m|
          rate_value = rand(5)
          Rate.create(rateable_id: public_collection_n.id , rateable_type: "collection", user_id: m+1 , rate: rate_value)
          Activity.create(activitable_id: public_collection_n.id, action: "rate", user_id: m+1,
                          activitable_type: "collection", activitable_title: public_collection_n.title, value: rate_value)
          Comment.create(commentable_id: public_collection_n.id , commentable_type:"collection", user_id: m+1, number_of_marks: m, text: "good_collection_#{n}")
          Activity.create(activitable_id: public_collection_n.id, action: "comment", user_id: m+1,
                          activitable_type: "collection", activitable_title: public_collection_n.title, value: "good_collection_#{n}")
        end
        public_collection_n.update_attributes(rate: Rate.where(rateable_id: public_collection_n.id, rateable_type: "collection").average('rate').to_f)        
      end      
    end
  end
end
