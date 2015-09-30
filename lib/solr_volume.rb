class SolrVolume
  attr_accessor :title, :author, :subject, :rate, :views, :names, :job_id, :date
  
  def initialize(options)
    @title = options[:title]
    @author = options[:author]
    @subject = options[:subject]
    @rate = options[:rate]
    @views = options[:views]
    @names = options[:names]
    @job_id = options[:job_id]
    @date = options[:date]
  end
end