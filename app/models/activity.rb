class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activitable, polymorphic: true

  validates :user_id, presence: true
  validates :activitable_id, presence: true
  validates :action, presence: true
  validates :activitable_type, presence: true

  def self.filter_and_sort_activities(filter, sort, page)
    case filter
      when 'comments'
        filter_stmt = "action = 'comment'"
      when 'rate'
        filter_stmt = "action = 'rate'"
      when 'collections'
        filter_stmt = "activitable_type = 'collection'"
      else
        filter_stmt = ''
    end
    Activity.where(filter_stmt).order("created_at #{sort}").paginate(page: page, per_page: PAGE_SIZE)
  end

  def self.add_activity(options)
    Activity.create(options)
  end
end
