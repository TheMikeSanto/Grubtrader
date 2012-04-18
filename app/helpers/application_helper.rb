module ApplicationHelper
	def active_page_class(page)
		"active" if controller.controller_name == page
	end

	def flash_status(flash)
		return "success" if flash.first[0].to_s == "notice"
		"error"
	end
end
