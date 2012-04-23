$(document).ready(function(){
	$(".order_line").first().find(".remove").addClass("hidden").hide();

	$(".order_line a").click(function() {
		if ($(this).hasClass("add")) {
			$(this).hide().closest(".order_line").next().removeClass("hidden").addClass("visible").show();
		} else if ($(this).hasClass("remove")) {
			$(this).closest(".order_line").addClass("hidden").remove()
		}

		visible = $(".visible");

		if (visible.length > 1) {
			visible.first().find(".remove").hide();
		}

		visible.last().find(".add").show(); // We always want the add button visible on the last line
	});
});