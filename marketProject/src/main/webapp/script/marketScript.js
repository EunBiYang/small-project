
function replyCheck(){
	var frm=document.replyFrm;
	
	if(!frm.reply_content.value){
		alert("내용을 입력하세요");
		frm.reply_content.focus();
	}else{
		frm.submit();
	}
}

function re_replyCheck(){
	var frm=document.re_replyFrm;
	
	if(!frm.reply_content.value){
		alert("내용을 입력하세요");
		frm.reply_content.focus();
	}else{
		frm.submit();
	}
}
