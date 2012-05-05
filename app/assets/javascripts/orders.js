$(document).ready(function(){
	$(".line_item").first().find(".remove").addClass("hidden").hide();
	$(".line_item").last().find(".add").remove();

	$(".line_item a").click(function() {
		if ($(this).hasClass("add")) {
			$(this).hide().closest(".line_item").next()
				.removeClass("hidden").addClass("visible")
				.show();
		} else if ($(this).hasClass("remove")) {
			$(this).closest(".line_item")
				.addClass("hidden").removeClass("visible")
				.hide();
				update_disabled_selections();
		}

		visible = $(".visible");

		if (visible.length > 1) {
			visible.first().find(".remove").hide();
		}

		visible.last().find(".add").show(); // We always want the add button visible on the last line

	});

	submitted = false;
	$("#new_order").submit(function(ev) {
		if (submitted == false) {
			ev.preventDefault();
			$("#confirmation").dialog({title: "Confirm Order",
																	width: "400px", 
																	modal: true });
			submitted = true;
		} 
	})
});

$("#new_order select").change(function() {
	selected 	= $(this).find("option:selected");
	line_item = selected.closest(".line_item");
	product 	= selected.html();
	unit 			= $("tr." + product).data("unit");
	amount_regex = /[a-zA-Z0-9]/;
	amount		= amount_regex.exec($("tr." + product + " td")
							.last().text());

	console.log(amount);
	// Enable the quantity box and show the unit next to it
	line_item.find(".quantity").removeAttr('disabled')
		.val(amount);
	line_item.find(".unit").html(unit);

	update_disabled_selections();	

})

function update_disabled_selections() {
	// Remove the selected attribute from any other line item
	$.each($(".line_item"), function() {
		selector = $(this).find("select");
		selected = selector.find("option:selected");
		product 	= selected.html();

		$.each($(".line_item"), function() {
			inner_selector = $(this).find("select");
			inner_selected = inner_selector.find("option:selected");
			inner_product  = inner_selected.html();

			if (inner_product != product) {
				$.each(inner_selector.children(), function() {
					$(this).removeAttr('disabled');
					if ($(this).html() == product) {
						$(this).attr('disabled', 'disabled');
					}
				});
			}
		});
	});
}