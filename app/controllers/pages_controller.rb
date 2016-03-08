class PagesController < ApplicationController
  layout 'application'
  include SolrHelper
  include BooksHelper
  
  def home
    prepare_statistics_part
    
    prepare_top_collections_part
    
    prepare_most_viewed_books_part
    
    prepare_activity_log
    
    #for top rated books
    #prepare_top_rated_books_part    
  end  
  
  def top_rated_books
   prepare_top_rated_books_part
   respond_to do |format|  
     format.html { render partial: 'pages/top_books', locals: { top_books: @top_rated_response[:volumes], top_criteria: "rate" } }
   end
  end
  
  def about
    @page_title = I18n.t('common.about_us')
  end
  
  def contact
    @email_message = EmailMessage.new
    @verify_captcha = true
  end
  
  def send_contact_us_message
    @email_message = EmailMessage.new(EmailMessage.email_message_params(params[:email_message]))
    if @email_message.valid?
      handle_valid_email_message
    else
      handle_invalid_email_message
    end
  end
  
  private
  
  def prepare_top_collections_part
    @top_collections = Collection.top
  end
  
  def prepare_statistics_part
    @statistics = BhlStatistic.get_last_bhl_statistic
  end
  
  def prepare_most_viewed_books_part
    @most_viewed_response = search_volumes( "*:*", 1, MOST_VIEWED_BOOKS, "views desc")
  end
  
  def prepare_top_rated_books_part
    @top_rated_response = search_volumes( "*:*", 1, MOST_VIEWED_BOOKS, "rate desc")
  end
  
  def prepare_activity_log
    @ctivities_count = Activity.count
  end
  
  def handle_valid_email_message
    @email_message.save
    if Notifier.contact_message(params[:email_message][:name],params[:email_message][:email],
                                params[:email_message][:subject],params[:email_message][:message]).deliver
      redirect_to contact_pages_path, flash: { notice: I18n.t('msgs.contact_us_successful_feedback') }
    else
      redirect_to contact_pages_path, flash: { notice: I18n.t('msgs.contact_us_unsuccessful_feedback') }
    end
    
  end
  
  def handle_invalid_email_message
    @verify_captcha = true
    @email_message.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless bhl_verify_recaptcha
    render 'contact'
  end
end