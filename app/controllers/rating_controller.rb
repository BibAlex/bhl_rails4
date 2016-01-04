class RatingController < ApplicationController
  include SolrHelper

  before_filter :check_authentication, only: :rate

  def rate
    avg_rate = update_rate(params)
    respond_to do |format|
      format.html { render partial: "rating/avg_rate", locals: { rate: avg_rate , type: params[:rateable_type]} }
    end
  end

  def detailed_rate
    @rate_array=[]
      (1..5).each do |n|
        @rate_array <<  Rate.where(rate: n.to_f, rateable_id: params[:rateable_id], rateable_type: params[:rateable_type]).count
      end
    respond_to do |format|
      format.html { render partial: "books/detailed_rate" }
    end
  end

  def update_rate(params)
    rateable = Rate.find_or_initialize_by(user_id: params[:user_id], rateable_id: params[:rateable_id], rateable_type: params[:rateable_type])
    if params[:value] == 0
      rateable.destroy
    else
      rateable.update(rate: params[:value])
    end
    avg_rate = Rate.where(rateable_id: params[:rateable_id], rateable_type: params[:rateable_type]).average('rate').to_f
    if params[:rateable_type] == "volume"
      update_volume_rate(params[:rateable_id], avg_rate)
    else
      update_other_rateable_objects(params[:rateable_type], params[:rateable_id], avg_rate)
    end
    avg_rate
  end

  def update_volume_rate(job_id, avg_rate)
    rateable_object = Volume.find_by_job_id(job_id)
    rateable_object.update_attributes(rate: avg_rate)
    update_volume_rate_in_solr(job_id, avg_rate)
  end

  def update_other_rateable_objects(rateable_type, rateable_id, avg_rate)
    rateable_object = params[:rateable_type].camelize.constantize.find(params[:rateable_id])
    rateable_object.update_attributes(rate: avg_rate)
  end

end
