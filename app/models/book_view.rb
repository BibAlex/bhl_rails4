class BookView < ActiveRecord::Base  
  
  def self.save_book_also_viewed(params, session_book_id, volume)
    if(session_book_id != nil && session_book_id != params[:id].to_i)
       if BookView.where(source_book_id: params[:id].to_i, dest_book_id: session_book_id).blank? && 
          BookView.where(source_book_id: session_book_id, dest_book_id: params[:id].to_i).blank?
         BookView.create(source_book_id: session_book_id, dest_book_id: params[:id].to_i)
      end
    end    
  end
end
