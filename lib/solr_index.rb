module SOLR
  class Indexer
    def self.fill_solr_with_sample_data
      solr_books_core = RSolr::Ext.connect url: SOLR_BOOKS_METADATA
      solr_books_core.delete_by_query('*:*')
      solr_books_core.commit
        
      Volume.find_each do |volume|
        doc  = {}
        doc[:job_id] = volume.job_id
        volume.update_attributes(rate: rand(5))
        doc[:rate] = volume.rate
        doc[:views] = UserVolumeHistory.where(volume_id: volume.job_id).sum('total_number_of_views')
        book = Book.find(volume.book_id)
        doc[:bib_id] = book.bib_id
        doc[:title_sort] = book.title.split(",")[0]
        languages = book.languages.select(:code)
        doc_languages = []
        languages.each do |language|
          doc_languages << language.code
          doc["title_#{language.code[0..1]}"] = book.title.split(",") unless book.title.nil?
          doc["publisher_#{language.code[0..1]}"] = book.publisher.split(",") unless book.publisher.nil?
          doc["author_#{language.code[0..1]}"] = []
          book.authors.select(:name).each do |author|
            doc["author_#{language.code[0..1]}"] << author.name
          end
          doc["subject_#{language.code[0..1]}"] = []
          book.subjects.select(:name).each do |subject|
            doc["subject_#{language.code[0..1]}"] << subject.name
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