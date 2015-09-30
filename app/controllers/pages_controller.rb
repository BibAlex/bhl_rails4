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
     format.html { render partial: 'pages/top_books', locals: { top_books: @top_rated_response, top_criteria: "rate" } }
   end
  end
  
  def about
    
  end
  
  def contact
    
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
end
