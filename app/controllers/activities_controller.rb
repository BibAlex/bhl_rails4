class ActivitiesController < ApplicationController
  
  def get_activity_log
    @total_activities = Activity.count
    start = params[:start].to_i
    @offset = (start > 1) ? (start - 1) * HOME_LOG_ACTIVITIES : 0
    @activities = Activity.order("created_at DESC").offset(@offset).limit(HOME_LOG_ACTIVITIES)
    respond_to do |format|
      format.html { render partial: "pages/get_activity_log" }
    end
  end
  
  def index
    
  end
end


