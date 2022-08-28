$(function() {
		$("#category1").load("category-data.html #category1-1", function(){
			$(this).show();
		});

		$(document).on("change", "#category1 > select", function() {
			$("#category2").empty().hide();//비우고 감춰라~!
			$("#category3").empty().hide();

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
		});
	});