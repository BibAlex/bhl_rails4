module BooksHelper

  # not updated: will be updated after finishing books search function
  def addFacetSearch(params, type, field)
      tmp_params = params.clone
      if (tmp_params["_#{type}".to_sym] != nil && tmp_params["_#{type}".to_sym] != '')
        tmp_params["_#{type}".to_sym] = field + " _AND " + tmp_params["_#{type}".to_sym]
      else
        tmp_params["_#{type}".to_sym] = field
      end
      tmp_params[:controller] = nil
      tmp_params[:action] = nil
      tmp_params[:page] = nil
      tmp_params[:sort_type] = nil
      tmp_params
  end
  
  def search_volumes(query, page, limit, sort_type)
    response = search_facet_highlight(query, page, limit, sort_type)
    process_solr_volumes(response)
  end
  
  def fill_response_array(arr)
    counter = 1
    array = []
    if(arr.count > 1)
      arr.each do |term|
        if(counter > MAX_NAMES_PER_BOOK)
          break
        else
          array << term
          counter += 1
        end
      end
    else
      array << arr[0]
    end
    array
  end
  
  def get_names_info(sci_names)
   sci_names_info = []
    sci_names.each do |sci_name|
      info = get_name_info(sci_name)
     sci_names_info <<  info unless info.nil?
    end
    sci_names_info
  end
  
  def name_tip (job_id, string, eol_thumb, eol_page_id)
    title_tip = ''
    if eol_thumb
      thumb = ATTACHMENTS_URL + THUMB_FOLDER + eol_thumb
      title_tip = "<div style='float:left'>  
                    <img style='height:100px' src='#{thumb}'></img>
                   </div>"
    end
    title_tip += "<div style='float:left'>
                    <span >#{string}</span>
                    <ul>  
                      <li><a href='../books/#{job_id}/read'>#{I18n.t(:find_in_book)}</a>"
    if eol_page_id != nil && eol_page_id > -1
      title_tip += "<li><a href='http://eol.org/pages/#{eol_page_id}'>#{I18n.t(:view_in_eol)}</a>"
    end
    title_tip += "<li><a href='../books?_name=#{string}'>#{I18n.t(:books_with_name)}</a>
                    </ul>
                  </div>"    
    title_tip
  end
  
  def book_names_more_open_div(vol_jobid, sci_names_count)
    more_names = ''
    if sci_names_count > MAX_NAMES_PER_BOOK
      count = 
      more_names = I18n.t('common.and_count_more', count: (sci_names_count - MAX_NAMES_PER_BOOK))
    end
    "<a href = '#' data-toggle='modal' data-target ='#morenamesdiv_#{vol_jobid}'>#{more_names}</a>".html_safe
  end
  
  private
  
  def process_solr_volumes(solr_response)
    volumes = []
    solr_response["response"]["docs"].each do |doc|
      lang = doc["language_facet"][0][0..1]
      sci_names = get_sci_names_of_volume(doc[:job_id])
      options = { title: doc["title_#{lang}"], author: doc["author_#{lang}"], subject: doc["subject_#{lang}"],
                  rate: doc["rate"], views: doc["views"], job_id: doc["job_id"], date: doc["date"], sci_names: sci_names }
      volumes << options
    end
    volumes
  end

end