module CommentsHelper
  
  def get_class_for_abuse(abuse)
    if(abuse >= MAX_NO_ABUSE)
      ""
    else
      "display:none"
    end
  end

  def get_class_for_comment(abuse)
    if(abuse >= MAX_NO_ABUSE)
      "display:none"
    else
      ""
    end
  end
  
  def get_comment_replies_count(comment_id)
    Comment.where(commentable_type: "comment", commentable_id: comment_id).count
  end
  
  def is_comment_has_replies?(comment_id)
    if (Comment.where(commentable_type: "comment", commentable_id: comment_id).count == 0)
      false
    else
      true
    end
  end
end
