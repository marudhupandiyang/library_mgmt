
$(function(){

	$("a").live("click",function(){
		
		if (( $(this).html() == "delete"  ) || ( $(this).html() == "Re Issue") )  return true ;

		$.get(this.href,null,function(data){ $("#body_content").html(data)});
		return false;

	});


	$(".pagination a").live("click",function(){
		$(".pagination").html("Page is loading");
		$.get(this.href,null,null,"script");
		return false;

	});

});



// jQuery.ajaxSetup({
// 	'beforeSend' : function(xhr) { xhr.setRequestHeaer("Accept","text/javascript") }

// });



 // $.fragmentChange(true);
 //  $(document).bind("fragmentChange.page", function() {
 //    $.getScript($.queryString(document.location.href, { "page" : $.fragment().page }));
 //  });
  
 //  if ($.fragment().page) {
 //    $(document).trigger("fragmentChange.page");
 //  }
