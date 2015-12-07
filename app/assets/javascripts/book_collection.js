function add_book_to_collection(job_id)
{
	var add_book_url = "";
	create_new_collection = document.getElementById("create_new_collection_"+ job_id);
	if(create_new_collection.checked)
	{
		collection_title = document.getElementById("collection_title_"+ job_id).value;
		collection_description = document.getElementById("collection_description_"+ job_id).value;
		collection_is_public = document.getElementById("is_public_"+ job_id).value;
		add_book_url = "/collections/add_book?job_id=" + job_id + "&title=" + escape(collection_title) + "&description=" + escape(collection_description) + "&is_public=" + collection_is_public;
	}
	else
	{
		 var e = document.getElementById("idselect_" + job_id);
		 var strUser = e.options[e.selectedIndex].value;
 		 add_book_url = "/collections/add_book?job_id=" + job_id + "&col_id=" + strUser;
	}	
	$.ajax({
	    url: add_book_url,
	    type: "GET",        
	    success: function (data) { 
	      $("#flash").html(data);
	      $("#collection_modal_" + job_id).modal('hide');
	    }
	  });
}


function load_collections(job_id)
{
	$.ajax({
	    url: "/collections/load?job_id=" + job_id,
	    type: "GET",        
	    success: function (data) {
	      $("#collection_modal_" + job_id).html(data);
	      $("#collection_modal_" + job_id).modal('show');
	    }
	  });
	
}
