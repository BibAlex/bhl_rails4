class ErrorsController < ApplicationController
  
  def bad_request
    respond_to do |format|
      format.html { render template: 'errors/bad_request', status: 400 }
      format.all  { render nothing: true, status: 400 }
    end
  end
  
end