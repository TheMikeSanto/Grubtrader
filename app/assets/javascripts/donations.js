$(function() {
	$(".date input").datepicker(
		{ dateFormat: "dd-mm-yy",
			minDate: '-1m'
	});

	$("#new_donation select").change(function() {
		selected = $(this).find("option:selected");
		line_item = selected.closest(".line_item");
		product = selected.html();
		unit = $("#" + product).data("unit");

		line_item.find(".unit").html(unit);
	})
});