module UsersHelper
  include ApplicationHelper
  include BooksHelper
  def is_logged_in?
    session[:user_id].nil? ? false : true
  end

  def is_logged_in_user?(user_id)
    session["user_id"].to_i == user_id.to_i
  end

  def get_user_form_params(user)
    if user.new_record?
      { page_title: I18n.t('common.signup'), verify_captcha: true }
    else
      { page_title: I18n.t('common.modify_profile'), verify_captcha: false }
    end
  end

  def get_tab_class(tab, current_tab)
    tab == current_tab ? "active" : ""
  end

  def authenticate_user(user_id)
    redirect_to login_users_path and return false unless is_logged_in?
    redirect_to user_path(id: params[:id]), flash: {error: I18n.t('msgs.access_denied_error')} and return false unless is_logged_in_user? user_id
    return true
  end

   def parse_query(query_string)
    parsed_query=''
    sub_queries = query_string.split("&")
    if sub_queries.nil?
      parsed_query
    else
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        if terms[1] != nil
          parsed_query += "<b>#{I18n.t('common.'+ terms[0].tr("_",""))}</b>: #{terms[1]}<br/>"
        end
      end
      parsed_query = parsed_query[0,parsed_query.length-5]
    end
   end

   def get_number_of_returned_books(query_string)
    url_params = {}
    sub_queries = query_string.split("&")
    if sub_queries.any?
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        url_params [terms[0]] = terms[1]
      end
    end
    query_array = fill_query_array(url_params)
    query = set_query_string(query_array, "AND")
    fquery = set_fquery_string(query_array)
    response = search_volumes(query, 1, PAGE_SIZE, '', fquery)
    response[:total_number_of_volumes]
  end
end