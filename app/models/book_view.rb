class BookView < ActiveRecord::Base  
  
  def self.save_book_also_viewed(params, session_book_id, volume)
    if(session_book_id != nil && session_book_id != params[:id].to_i)
       if BookView.where(source_book_id: params[:id].to_i, dest_book_id: session_book_id).blank? && 
          BookView.where(source_book_id: session_book_id, dest_book_id: params[:id].to_i).blank?
         source_book_title = find_field_in_document(session_book_id, "title")[0]
         BookView.create(source_book_id: session_book_id, dest_book_id: params[:id].to_i, source_book_title: source_book_title, dest_book_title: volume[:title][0])
      end
    end    
  end
end
