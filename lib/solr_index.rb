module SOLR
  class Indexer
    def self.fill_solr_with_sample_data
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
          doc[:title_sort] = book.title.split(",")[0]
          languages = []
          book.languages.select(:code).each do |language|
            if ["eng", "fre", "ara", "ger", "ita"].include?(language.code) 
              languages << language.code  
            end
          end
          languages << "ud" if languages.blank?
          # languages = book.languages.select(:code)
          doc_languages = []
          languages.each do |language|
            doc_languages << language
            doc["title_#{language[0..1]}"] = book.title.split(",") unless book.title.nil?
            doc["publisher_#{language[0..1]}"] = book.publisher.split(",") unless book.publisher.nil?
            doc["author_#{language[0..1]}"] = []
            book.authors.select(:name).each do |author|
              doc["author_#{language[0..1]}"] << author.name
            end
            doc["subject_#{language[0..1]}"] = []
            book.subjects.select(:name).each do |subject|
              doc["subject_#{language[0..1]}"] << subject.name
            end
          end
          doc[:language_facet] = doc_languages        
          solr_books_core.add(doc)
          solr_books_core.commit
          solr_books_core.optimize
        end
      end
    end
  end
end