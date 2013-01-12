// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// Author travesing
//var search_entry = " <ul>  <% _.each(book,function(entry) { %> <li> <%= entry.title %> &nbsp; &nbsp; <%= entry.price %> <br/> <% _.each(entry.authors,function(auth){ %> <li class='authors'>  <%= auth.name %> </li>  <% }) %></li> <% }) %> </ul>";

var search_entry = " <ul> <% _.each(book,function(entry) { %> <li>  <a href ='/books/<%= entry.id %>' > <%= entry.title %> </a> &nbsp; &nbsp; <%= entry.price %> <br/>   <%= entry.authors %> </li> <% }) %> </ul>";
//var admin_search_entry = " <ul>  <% _.each(book,function(entry) { %> <li> <%= entry.title %>  'Add More' </li> <% }) %> </ul>";

function submit_search(){

	$.ajax( {url: '/search' , 
		
		data: {query: $("#query").val()},
		
		type:"post",
		dataType: "json",
		success: function(data){
				$("#search_result").html();
//			_.each (data, function(entry){
					//alert(entry.title);
					if (data == "") {
						$("#search_result").html("No data found");
					}
					else{
						$("#search_result").html(_.template(search_entry,{book : data }));
					}

//			});
			

		}

	 });
}



function addbook(bookid){

	var count = prompt("Enter the Number of Book",0)
	if (count >0 ){

	$.ajax( {url: '/addbook/'  + bookid, 
		
		data: {count: count				
			},
		
		type:"post",
		success: function(data){

			alert(data)	;
			
			$.get('/books/' + bookid,null,function(data){ $("#loading").hide(); $("#body_content").html(data)});
			

		}

	 });

	}
}