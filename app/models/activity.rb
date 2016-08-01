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
    actv = Activity.where(filter_stmt).order(created_at: sort).paginate(page: page, per_page: PAGE_SIZE)
    # http://localhost:3000/en/activities?filter=rate&sort=select%20action%20from%20activities%20where%20id%20=1
  end

  def self.add_activity(options)
    Activity.create(options)
  end
end
