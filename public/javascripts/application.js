// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	var elt = $("#container_notification") ;
	if(elt.html() != '' )
	{
		elt.slideDown();
		setTimeout(function(){
			elt.slideUp('slow');
		},2000);
	}
});