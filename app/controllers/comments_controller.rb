class CommentsController < ApplicationController
  include UsersHelper

  before_filter :check_authentication, only: [:create, :delete, :mark]
  # before_filter :clean_params

  def create
    clean_params_for_comments(Comment.comment_params(params[:comment]))
    Comment.create(Comment.comment_params(params[:comment]))
    redirect_to_back_or_default
  end

  def get_comments
    clean_params_for_comments(params)
    if params[:commentable_id] && params[:commentable_type]
      comments  = Comment.where(commentable_id: params[:commentable_id],
                     commentable_type: params[:commentable_type]).order('created_at DESC')
                     .paginate(page: params[:page] || 1, per_page: LIMIT_CAROUSEL)
      respond_to do |format|
        format.html { render partial: 'comments/get_comments', locals: {comments: comments, commentable_type: params[:commentable_type], commentable_id: params[:commentable_id] } }
      end
    else
      resource_not_found
    end
  end

  def mark
    clean_params_for_comments(params)
    comment = Comment.find_by_id(params[:id])
    if comment
      comment.increment(:number_of_marks)
      comment.save
      data = comment.number_of_marks
      render json: data
    else
      resource_not_found
    end
  end

  def delete
    clean_params_for_comments(params)
    comment = Comment.find_by_id( params[:id])
    if comment
      if !is_logged_in_user?(comment.user_id)
        return unauthorized_action
      elsif comment.can_delete?
        commentable_type = comment.commentable_type
        comment.destroy
        if commentable_type == 'comment'
          flash[:notice] = I18n.t('msgs.reply_deleted')
        else
          flash[:notice] = I18n.t('msgs.comment_deleted')
        end
      else
        flash[:error] = I18n.t('msgs.can_not_delete_comment')
      end
      redirect_to_back_or_default
    else
      resource_not_found
    end
  end
  
  private
    def clean_params_for_comments(params)
      special = "+?<>',?[]}{=-)(*&^%$#`~{}\""
      regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
      params.each do |key, value|
        redirect_to(controller: "errors", action: "bad_request") if key =~ regex
        if value.kind_of?(Hash)
          value.each do |k,v|
            redirect_to(controller: "errors", action: "bad_request") if value[k] =~ regex
          end
        else
          redirect_to(controller: "errors", action: "bad_request") if value =~ regex
        end
      end
    end


end
