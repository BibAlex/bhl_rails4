class CommentsController < ApplicationController

  before_filter :check_authentication, only: [:create, :delete]

  def create
    Comment.create(Comment.comment_params(params[:comment]))
    redirect_to :back
  end

  def get_comments
    comments  = Comment.where(commentable_id: params[:commentable_id], commentable_type: params[:commentable_type]).order("created_at DESC")
                       .paginate(page: params[:page], per_page: LIMIT_CAROUSEL)
    respond_to do |format|
      format.html { render partial: "comments/get_comments", locals: { comments: comments, commentable_type: params[:commentable_type], commentable_id: params[:commentable_id] } }
    end
  end

  def mark
    comment = Comment.find(params[:id])
    comment.increment(:number_of_marks)
    comment.save
    data = comment.number_of_marks
    render :json => data
  end

  def delete
    comment = Comment.find( params[:id])
    if comment.can_delete?
      commentable_type = comment.commentable_type
      comment.destroy if comment
      if commentable_type == "comment"
        flash[:notice] = I18n.t('msgs.reply_deleted')
      else
        flash[:notice] = I18n.t('msgs.comment_deleted')
      end
    else
      flash[:error] = I18n.t('msgs.can_not_delete_comment')
    end
    redirect_to :back
  end


end
