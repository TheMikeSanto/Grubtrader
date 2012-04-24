$(document).ready(function(){
	$(".line_item").first().find(".remove").addClass("hidden").hide();

	$(".line_item a").click(function() {
		if ($(this).hasClass("add")) {
			$(this).hide().closest(".line_item").next().removeClass("hidden").addClass("visible").show();
		} else if ($(this).hasClass("remove")) {
			$(this).closest(".line_item").addClass("hidden").remove()
		}

		visible = $(".visible");

		if (visible.length > 1) {
			visible.first().find(".remove").hide();
		}

		visible.last().find(".add").show(); // We always want the add button visible on the last line
	});
});