$(document).ready(function showhidePostform() {

		$(".post_form").hide();
		$(".show_hide").show();
		
	$('.show_hide').click(function(){
		$(".post_form").slideToggle();
	});
});	
