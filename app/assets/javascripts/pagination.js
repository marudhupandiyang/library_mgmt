
$(function(){

	$("a").live("click",function(){
		
		
		
		if (( $(this).html() == "Add Quantity"  ) ||( $(this).html() == "delete"  ) || ( $(this).html() == "Re Issue") || ( $(this).html() == "Return") )  return true ;
		$("#loading").show();
		$.get(this.href,null,function(data){ $("#loading").hide(); $("#body_content").html(data)});
		return false;

	});


	$(".pagination a").live("click",function(){
		$("#loading").show();
		$.get(this.href,null,function(){$("#loading").hide();},"script");
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
