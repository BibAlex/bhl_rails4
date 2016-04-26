module SOLR
  class Indexer
    def self.fill_solr_with_sample_data
      index_volumes
      index_sci_names
      index_names_found
      index_locations
    end


    def self.index_volumes
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit

      Volume.find_each do |volume|
        book = Book.find(volume.book_id)
        if book.book_status_id != BookStatus.pending_metadata.id
          doc  = {}
          doc[:job_id] = volume.job_id
          volume.update_attributes(rate: rand(5))
          doc[:rate] = volume.rate
          doc[:views] = UserVolumeHistory.where(volume_id: volume.job_id).sum('total_number_of_views')

          doc[:bib_id] = book.bib_id
          doc[:title_sort] = book.title
          languages = []
          book.languages.select(:name).each do |language|
            if ["English", "Frensh", "Arabic", "German", "Italian"].include?(language.name)
              languages << language.name
            end
          end
          languages << "ud" if languages.blank?
          doc_languages = []
          languages.each do |language|
            doc_languages << language
            book_titles = []
            book_titles << book.title unless book.title.nil?
            book_titles << book.title_alternative unless book.title_alternative.nil?
            doc["title_#{language[0..1]}"] = book_titles
            doc["publisher_#{language[0..1]}"] = [book.publisher] unless book.publisher.nil?
            doc["author_#{language[0..1]}"] = []
            book.authors.select(:name).each do |author|
              doc["author_#{language[0..1]}"] << author.name
            end
            doc["subject_#{language[0..1]}"] = []
            book.subjects.select(:name).each do |subject|
              doc["subject_#{language[0..1]}"] << subject.name
            end
            doc["location_facet"] = []
            book.locations.select(:formatted_address).each do |location|
              doc["location_facet"] << location.formatted_address
            end
          end
          doc[:language_facet] = doc_languages
          solr_books_core.add(doc)
          solr_books_core.commit
          solr_books_core.optimize
        end
      end
    end

    def self.index_sci_names
      solr_sci_names_core = RSolr::Ext.connect url: SOLR_SCI_NAMES
      solr_sci_names_core.delete_by_query('*:*')
      solr_sci_names_core.commit

      Name.find_each do |name|
        doc = { sci_name: name.sci_name }
        solr_sci_names_core.add(doc)
        solr_sci_names_core.commit
        solr_sci_names_core.optimize
      end
    end

    def self.index_names_found
      solr_names_found_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
      solr_names_found_core.delete_by_query('*:*')
      solr_names_found_core.commit

      VolumeName.find_each do |volume_name|
        doc = { name_found: volume_name.name_found, job_id: volume_name.volume_id, page: volume_name.page_number, sci_name: Name.find(volume_name.name_id).sci_name }
        solr_names_found_core.add(doc)
        solr_names_found_core.commit
        solr_names_found_core.optimize
      end
    end


    def self.index_locations
      solr_locations_core = RSolr::Ext.connect url: SOLR_GEOLOCATIONS
      solr_locations_core.delete_by_query('*:*')
      solr_locations_core.commit

      location = Location.find(3)
      doc = { address: location.formatted_address, formatted_address: location.formatted_address, longitude: location.longitude, latitude: location.latitude }
      solr_locations_core.add(doc)
      solr_locations_core.commit
      solr_locations_core.optimize
    end

  end
end