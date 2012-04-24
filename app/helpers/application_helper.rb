module ApplicationHelper
	def active_page_class(page)
		"active" if controller.controller_name == page
	end

	def flash_status(flash)
		return "success" if flash.first[0].to_s == "notice"
		"error"
	end

	def formatted_date(date)
		date.strftime("%D")
	end
	
	def options_for_organization_select
		Organization.scoped.map{ |org| [org.name, org.id]}
	end

	def options_for_product_select
		Product.scoped.map{ |pc| [pc.name, pc.id]}
	end
	
	def options_for_in_stock_product_select
		options = []
		Product.scoped.each do |p|
			if p.available > 0
				options << [p.name, p.id]
			end
		end
		options
	end
	
	def options_for_product_category_select
		ProductCategory.scoped.map{ |pc| [pc.name, pc.id] }
	end

	def options_for_unit_select
		Unit.scoped.uniq.map{ |unit| [unit.name, unit.id] }
	end

	def options_for_shelf_life_select
		["days", "weeks", "months"]
	end

	def options_for_role_select
		Role.scoped.map{ |role| [role.name, role.id] }
	end

	def line_item_summary(line)
		if line.is_a? OrderLine
			summary = line.quantity_requested.to_s
		elsif line.is_a? DonationLine
			summary = line.quantity.to_s
		else
			return nil
		end

		[summary, line.product.unit.name, line.product.name.downcase].join(" ")
	end
end
