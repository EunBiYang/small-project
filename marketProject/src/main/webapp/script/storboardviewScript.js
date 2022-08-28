function onDisplay(){
	const re_reply=document.getElementsByClassName('re_reply');
	re_reply[1].style.display="block";
}

function offDisplay(){
	
	const re_reply=document.getElementsByClassName('re_reply')[1];
	re_reply.style.display="none";
}



$(document).ready(function(){
	$(".re").click(function(){
		var index=$('.re').index(this);
		$(".re_reply").eq(index).show();
	})
	
	$(".modify").click(function(){
		var index=$('.modify').index(this);
		$(".re_modify").eq(index).show();
	})
	
	
	$(".c").click(function(){
		var index=$('.c').index(this);
		$(".re_reply").eq(index).hide();
	})
	
	$(".m_c").click(function(){
		var index=$('.m_c').index(this);
		$(".re_modify").eq(index).hide();
	})
	
	
    $('.bxslider').bxSlider();
  });