function check() {
   var frm = document.storeboardWriteForm;

   if (!frm.image1.value) {
      alert("가게 사진을 넣어주세요.");
      frm.image1.focus();
   } else if (!frm.storeName.value) {
      alert("가게 이름을 입력하세요.");
      frm.storeName.focus();
   } else if (!frm.storePlace.value) {
      alert("가게 위치를 입력하세요.");
      frm.storePlace.focus();
   } else if (!frm.storeNum.value) {
      alert("가게 전화번호를 입력하세요.");
      frm.storeNum.focus();
    } else if (!frm.storeCategory.value) {
      alert("가게 카테고리를 골라주세요.");
      frm.storeCategory.focus();
   } else if(isNaN(frm.storeNum.value)) {
	  alert("가게 전화번호는 숫자로 입력하세요.");
	  frm.storeNum.value = "";
      frm.storeNum.focus();
  } else if (!frm.storeContent.value) {
      alert("가게 소개를 입력하세요.");
      frm.storeContent.focus();
   } else {
      frm.submit();
   }
}
