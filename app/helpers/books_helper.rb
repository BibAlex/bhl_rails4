module BooksHelper
  def facet_list(response, field)
    list = []
    response.facets.each do |facet|
      if facet.name == field
        facet.items.each do |item|
          if (item.hits) > 0
            list << {:name => item.value, :count => item.hits}
          end
        end
        break
      end
    end
    list
  end
  
  def item_count (type, item)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    #Added double quotes over item to handle special characters like "[" and "]"
    search = rsolr.select :params => { :q => type + ":" + "\"#{item}\"", :fl => "vol_jobid"}
    search['response']['numFound']
  end
  
  def item_count_format (type, item)
    format = item + ' (' + item_count(type, item).to_s + ')'
  end
  
  #for displaying highlighted items with count resulted from solr search
  def item_count_format_highlight (type, item, display)
    format = display.html_safe + ' (' + item_count(type, item).to_s + ')'
  end
  
  def get_format(id, format)
    
    if format == 'mods'
      format = ""
      mods = Book.find_by_id(Volume.find_by_job_id(id).book_id).mods
      if !mods.nil?
        mods.slice!(0) if mods[0] == "?" # This should remove leading "?" from mods
        # this is used to beautify xml display 
        doc = REXML::Document.new mods
        out = ""
        doc.write(out, 1)
        format = out
      end
    elsif format == 'bibtex'
      bibtex = Book.find_by_id(Volume.find_by_job_id(id).book_id).bibtex
      format = ""
      if !bibtex.nil?
        bibtex = bibtex[1..-1] if bibtex[0] == "?"
        format = bibtex if bibtex
      end
    elsif format == 'endnote'
      endnote = Book.find_by_id(Volume.find_by_job_id(id).book_id).endnote
      format = ""
      if !endnote.nil?
        endnote = endnote[1..-1] if endnote[0] == "?"
        format = endnote
      end
    end
  end
  
  def book_names (vol_jobid)
    result = []
    names = Name.find_by_sql("
      SELECT names.*, COUNT(page_names.name_id) as count
                FROM names
                  INNER JOIN page_names ON (page_names.name_id = names.id)
                  INNER JOIN pages ON(page_names.page_id = pages.id)
                  INNER JOIN volumes ON (volumes.id = pages.volume_id)
                  WHERE volumes.job_id = #{vol_jobid}
                  GROUP BY name_id 
                  ORDER BY count DESC
                  LIMIT 0,#{MAX_NAMES_PER_BOOK}
    ")
    names.each do |name|
      result << name.string
    end
    result
  end
  
  def book_names_list_names(vol_jobid)
    names = Name.find_by_sql("
      SELECT DISTINCT(names.id), names.string
      FROM names
        INNER JOIN page_names ON (page_names.name_id = names.id)
        INNER JOIN pages ON(page_names.page_id = pages.id)
        INNER JOIN volumes ON (volumes.id = pages.volume_id)
       WHERE volumes.job_id = #{vol_jobid}
    ")
    names
  end
  
  def book_names_more_open_div(vol_jobid)
    names = Name.find_by_sql("
      SELECT COUNT(DISTINCT(names.id)) as count
      FROM names
        INNER JOIN page_names ON (page_names.name_id = names.id)
        INNER JOIN pages ON(page_names.page_id = pages.id)
        INNER JOIN volumes ON (volumes.id = pages.volume_id)
       WHERE volumes.job_id = #{vol_jobid}
    ")
    more_names = ''
    if names[0].count > MAX_NAMES_PER_BOOK
      count = names[0].count - MAX_NAMES_PER_BOOK
      more_names = I18n.t(:and_more, :count => count)
    end
    "<a href = '#' data-toggle='modal' data-target ='#morenamesdiv_#{vol_jobid}'>#{more_names}</a>".html_safe
  end
  
  def name_tip (job_id, id, string, eol_thumb, eol_page_id)
    title_tip = ''
    if eol_thumb != nil
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
  
  #fixing books page url to allow reading the params sent by Dar team for search
  def fix_dar_url(params)
    tmp = {}
    params.each do |key,value|
      if(key.to_s == "title" || key.to_s == "language" || key.to_s == "subject")
        tmp["_#{key.to_s}".to_sym] = value
        params.delete(key)
        break
      elsif(key.to_s == "authorName")
        tmp[:_author] = value
        params.delete(key)
        break
      end
    end
    params.reverse_merge!(tmp)
  end
  def set_query_array(query_array, params)
    query_array.each do  |key, value|
      query_array[key] = params["_#{key}".to_sym] ? params["_#{key}".to_sym].split(' _AND ') : ''
    end
    query_array
  end
  
  def searchAllQuery(query_array)
    query = ''
    string = ''
    query_array['ALL'].each do |val|
      value = "*#{val}* OR #{val}"
      query += query == '' ? "(bok_title:#{value} OR bok_language:#{value} OR published_at:#{value} " +
          "OR geo_location:#{value} OR author:#{value} OR name:#{value} OR subject:#{value} OR content:#{value}) "
          : " AND (bok_title:#{value} OR bok_language:#{value} OR published_at:#{value} OR geo_location:#{value} " + 
          "OR author:#{value} OR name:#{value} OR subject:#{value} OR content:#{value}) "
    end
    query
  end

  def search_facet_highlight(query, page, limit, sort_type)
    facet_array = ['author_ss', 'bok_language_s', 'subject_ss', 'published_at_ss', 'geo_location_ss' ,'name_ss']
    hl_array = ['bok_title','bok_language','name','published_at', 'geo_location', 'subject','author']
    return_field = "vol_jobid,bok_title,author,subject,views,rate,name"
    start = (page > 1) ? (page - 1) * limit : 0
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find  :q => query,:sort => sort_type, :facet => true, :fl => return_field, :start => start, :rows => limit,
      :hl => true, 'hl.fl' => hl_array, 'hl.simple.pre' => HLPRE, 'hl.simple.post'=> HLPOST, 'hl.requireFieldMatch'=> true,  #only highlight as the query suggest
      #'facet.date'=> 'bok_start_date', 'facet.date.start' =>'1500-01-01T00:00:00Z',
      #'facet.date.end' => '2020-01-01T00:00:00Z', 'facet.date.gap' => "+20YEAR",
      'facet.field' => facet_array, 'facet.mincount' => "1", 'facet.limit' => "4"
      response
  end
  
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
  
  def removeBreadCrumb(params, type, field)
    tmp_params = params.clone
    if (tmp_params["_#{type}".to_sym].include?("#{field} _AND "))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub("#{field} _AND ", '')
    elsif (tmp_params["_#{type}".to_sym].include?(" _AND #{field}"))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub(" _AND #{field}", '')
    elsif (tmp_params["_#{type}".to_sym] == field)
      tmp_params.delete("_#{type}".to_sym)      
    end
    tmp_params[:controller] = nil
    tmp_params[:action] = nil
    tmp_params[:page] = nil
    tmp_params[:sort_type] = nil
    tmp_params
  end
  
  def fillResponseArrays(doc, highlight, type, id)
    counter = 1
    array = []
    if(doc[type].length > 1)
      doc[type].each do |term|
        if(counter > MAX_NAMES_PER_BOOK)
          break
        else
          array << term
          counter += 1
        end
      end
    else
      array << doc[type]
    end
    
    if (highlight != nil && highlight[type] != nil)
      highlight[type].each do |hl_term|
        key = array.index(hl_term.gsub(HLPRE, '').gsub(HLPOST, ''))
        if(key == nil)
          array << hl_term
        else
          array[key] = hl_term
        end
      end
    end
    array
  end
  
  def searchParam(params)
    tmp_params = params.clone
    if (tmp_params[:books] != nil && tmp_params[:books]["searchby"] != nil)
      tmp_params[:books].delete("searchby")
    end
    tmp_params.delete("utf8")
    tmp_params
  end
  
  # add sort option to params
  def search_sort(params, sort_type)
    tmp_params = params.clone
    controller = params[:controller]
    tmp_params[:controller] = nil
    tmp_params[:sort_type] = sort_type
    tmp_params[:action] = nil
    tmp_params
  end

  def visited_volume?(user_history, vol)
    user_history.each do |row|
      return true if row[:volume_id] == vol[:id] 
    end
    return false
  end

    
  # def related_books(volume_id)
      # rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # #origin_book_names = rsolr.find :q => "vol_jobid:(#{volume_id})", :fl => "name"
      # origin_book_names=  Name.find_by_sql("
          # SELECT names.*, COUNT(page_names.name_id) as count
                    # FROM names
                      # INNER JOIN page_names ON (page_names.name_id = names.id)
                      # INNER JOIN pages ON(page_names.page_id = pages.id)
                      # INNER JOIN volumes ON (volumes.id = pages.volume_id)
                      # WHERE volumes.job_id = #{volume_id}
                      # GROUP BY name_id 
                      # ORDER BY count DESC
                      # LIMIT 0,#{MAX_NAMES_PER_BOOK}
        # ")
      # return_field = "vol_jobid,bok_title"
      # book_title = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).title
      # book_title = book_title.gsub(/\s+/) {" \" AND \" "} if book_title.split(" ").length > 1
      # query = "bok_title:(\"#{book_title}\")"
      # if ((origin_book_names != nil) && (origin_book_names.count > 0))
        # query+= " OR name:(\""
        # origin_book_names.each do |name|
          # if name.string!=nil
            # name.string = name.string.gsub(/\s+/) {" \" AND \" "} if name.string.split(" ").length > 1
            # query+= "(#{name.string}) \" OR \" " 
          # end
        # end
       # query = query[0,query.length-7] #-7 to remove "Last OR and double quotes"
       # query+= "\")"
    # end
       # response = rsolr.find :q => query, :fl => return_field
  # end
  
  def fill_carousel_array(response, id)
    total_array = []
    response['response']['docs'].each do |doc|
      if(doc['vol_jobid'] != id)
        element = {}
        element[:id] = doc[:vol_jobid]
        element[:photo_url] = !Volume.find_by_job_id(doc[:vol_jobid]).get_thumbnail_fail.nil? ? "/volumes/#{doc[:vol_jobid]}/thumb.jpg" : ""
        total_array << element
      end
    end
    total_array
  end

  
  def update_solr_views(volume)
    doc = solr_find_document("vol_jobid:#{volume.job_id}")
    doc[:views] = 0 if doc[:views].nil?
    doc[:views] = doc[:views] + 1
    #code added to prevent mistake of saving bok_publisher_t as an array in solr
    if (doc[:bok_publisher_t].kind_of?(Array))
      doc[:bok_publisher_t] = doc[:bok_publisher_t][0]
    end
 
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    #For XML uses
      #solr.update(:data => "<add><doc><field name='vol_jobid'>#{volume.job_id}</field><field name='views' update='set'>#{views}</field></doc></add>")
    solr.update :data => solr.xml.add(doc)
    solr.commit
    solr.optimize
  end
  def update_solr_rate(volume)
    doc = solr_find_document("vol_jobid:#{volume.job_id}")
    doc[:rate] = volume.rate
    if (doc[:bok_publisher_t].kind_of?(Array))
      doc[:bok_publisher_t] = doc[:bok_publisher_t][0]
    end

    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    #For XML uses
      #solr.update(:data => "<add><doc><field name='vol_jobid'>#{volume.job_id}</field><field name='views' update='set'>#{views}</field></doc></add>")
    solr.update :data => solr.xml.add(doc)
    solr.commit
    solr.optimize
  end
  
 
  def get_comment_replies_count(comment_id)
    total_number_of_replies = Comment.count_by_sql("SELECT count(*) 
                                                 FROM comments 
                                                 WHERE comments.comment_id=#{comment_id}")
  end
  
 def is_already_saved?(user_id, query)
   !(Query.where("user_id = ? and string = ?", user_id, query).empty?)
 end 
end