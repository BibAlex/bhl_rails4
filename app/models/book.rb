class Book < ActiveRecord::Base

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  has_many :book_languages, dependent: :destroy
  has_many :languages, through: :book_languages

  has_many :book_locations, dependent: :destroy
  has_many :locations, through: :book_locations

  has_many :book_subjects, dependent: :destroy
  has_many :subjects, through: :book_subjects

  has_many :volumes, dependent: :destroy
  belongs_to :book_statuses

  #validates :title, presence: true
  # I had to turn this check down. Pending metadata books will not have titles

  def meta_keywords
    volume = self.volumes.first
    solr_books_core = RSolr::Ext.connect url: SOLR_NAMES_FOUND
    response = solr_books_core.find q: "job_id:#{volume.job_id}", fl: "sci_name"
    response['response']['docs'].map{|item| "#{item['sci_name']}"}.join(", ")
  end

  def self.get_pending_metadata_books
    Book.where(:book_status_id => BookStatus.pending_metadata.id)
  end

  def self.get_pending_content_books
    Book.where(:book_status_id => BookStatus.pending_content.id)
  end

  def meta_author

  end

  def meta_description

  end

end
