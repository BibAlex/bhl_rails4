class SolrVolumesProcessor
  
  def process_solr_volumes(solr_response)
    volumes = []
    solr_response["response"]["docs"].each do |doc|
      lang = doc["language_facet"][0][0..1]
      options = { title: doc["title_#{lang}"], author: doc["author_#{lang}"], subject: doc["subject_#{lang}"], rate: doc["rate"], views: doc["views"], job_id: doc["job_id"], date: doc["date"] }
      volumes << SolrVolume.new(options)
    end
  end
end