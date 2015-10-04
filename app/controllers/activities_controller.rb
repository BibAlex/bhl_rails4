class ActivitiesController < ApplicationController
  
  def get_activity_log
    @total_activities = Activity.count
    start = params[:start].to_i
    @offset = (start > 1) ? (start - 1) * HOME_LOG_ACTIVITIES : 0
    @activities = Activity.order("created_at DESC").offset(@offset).limit(HOME_LOG_ACTIVITIES)
    respond_to do |format|
      format.html { render partial: "activities/get_activity_log" }
    end
  end
  
  def index
    @sort_filter = params[:sort] && params[:filter] ? "#{params[:filter]} #{params[:sort]}" : "all DESC"
    page = params[:page] ? params[:page].to_i : 1
    filter = params[:filter] ? params[:filter] : nil
    sort = params[:sort] ? params[:sort] : 'DESC'
    @activities = Activity.filter__and_sort_activities(filter, sort, page)    
  end
end


