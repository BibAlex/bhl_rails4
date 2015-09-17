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
end