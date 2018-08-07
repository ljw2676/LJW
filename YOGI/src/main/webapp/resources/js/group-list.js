$(function() {
		$('#searchbox').keypress(function(event) {
			if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
				searchSubmit();
			}
		});
		$('.btnEventSearch').click(function(event) {
			searchSubmit();
			});
		$('.Reset').click(function(event) {
			document.search_form.reset();
			}); 
		
		$('.date').appendDtpicker({
		"futureOnly" : true,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY/MM/DD",
		"dateOnly": true,
		"closeOnSelected": true,
		"calendarMouseScroll": false
		});
	});		
 		    function searchSubmit(){
 			var categorySize = "";
 			$("input[name=Category]:checked").each(function() {
 			if(categorySize == ""){
 			categorySize = $(this).val();
 			} else {
 			categorySize = categorySize + "|" + $(this).val();
 			}
 			});
 			var addrSize = "";
 			$("input[name=Addr]:checked").each(function() {
 			if(addrSize == ""){
 			addrSize = $(this).val();
 			} else {
 			addrSize = addrSize + "|" + $(this).val();
 			}
 			});
 			var paySize = "";
 			$("input[name=Pay]:checked").each(function() {
 			if(paySize == ""){
 			paySize = $(this).val();
 			} else {
 			paySize = paySize + "|" + $(this).val();
 			}
 			});
 			var dateSizs = "";
 			if(categorySize.length > 0){
 				$('#searchCategory').val(categorySize);
 			}
 			if(addrSize.length > 0){
 				$('#searchAddr').val(addrSize);
 			}
 			if(paySize.length > 0){
 				$('#searchPay').val(paySize);
 			}
 			if ($('#startdt').val() != null) {
 				$('#searchMStart').val($('#startdt').val());
 			}
		}