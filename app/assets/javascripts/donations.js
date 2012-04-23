$(function() {
	$(".date input").datepicker(
		{ dateFormat: "dd-mm-yy",
			minDate: '-1m'
	});
});