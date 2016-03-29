include ActionView::Helpers::SanitizeHelper

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :replies, class_name: "Comment", as: :commentable, dependent: :destroy
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy

  scope :collection_comments, ->{where(commentable_type: "collection")}
  validates :text, presence: true
  validates :commentable_id, presence: true
  before_save :sanitize_html
  after_save :update_activity

  def sanitize_html
    self.text = sanitize(text, :tags=>[])
  end

  def update_activity
    volume = Volume.find_by_job_id(self.commentable_id)
    collect = Collection.find_by_id(self.commentable_id)
    comment = Comment.find_by_id(self.commentable_id)
    if volume
       title =  (Book.find_by_id(volume.book_id)).title
    elsif collect
       title = collect.title
    elsif comment
       title = comment.text
    end
    Activity.add_activity({ activitable_id: self.commentable_id, action: "comment", user_id: self.user_id, 
                            activitable_type: self.commentable_type, value: self.text, activitable_title: title })
  end

  def self.comment_params(params)
    params.permit(:user_id, :text, :commentable_id, :commentable_type)
  end

   def can_delete?
     replies = Comment.where(commentable_id: self.id, commentable_type: "comment")
      if replies.count > 0
        false
      else
        true
      end
   end
end
