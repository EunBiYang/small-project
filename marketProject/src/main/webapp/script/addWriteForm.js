$(function() {
	$("#category1").load("category-data.html #category1-1", function(){
		$(this).show();
	});

	$(document).on("change", "#category1 > select", function() {
		$("#category2").empty().hide();//비우고 감춰라~!

		var target = $(this).find("option:selected").attr("data-target");
		var selector = "category-data.html "+target;//공백!
		
		//다음 항목 로드
		$("#category2").load(selector, function() {
			$(this).show();
		});
	});
	
	// 2depth에 대한 select 태그 이벤트 설정
	$(document).on("change", "#category2 > select", function() {
		
		if($(this).find("option:selected").index() > 0){
			//모든 select 태그 값을 추출
			var data1 = $("#category1 > select > option:selected").val();
			var data2 = $("#category2 > select > option:selected").val();
		}
		$('input[name=city]').attr('value',data1);
		$('input[name=gu]').attr('value',data2);	
	});
});

function checkWrite() {
	   var frm = document.add;
	   var file = document.getElementById("image").value;
	   
	if (!frm.title.value) {
			alert("제목을 입력해 주세요.");
			frm.name.focus();
		} else if (!frm.price.value) {
			alert("가격을 입력해 주세요.");
			frm.id.focus();
		} else if (!frm.category1.value) {
			alert("지역을 선택해 주세요.");
			frm.category1.focus();
		} else if (!frm.category2.value) {
			alert("동네를 선택해 주세요.");
			frm.category2.focus();
		} else if (!frm.content.value) {
			alert("내용을 입력해 주세요.");
		} else if (!file) {
			alert("파일을 선택해 주세요.");
		}  else {
			frm.submit();
		}
	}