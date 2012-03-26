module ApplicationHelper
	def active_page_class(page)
		"active" if controller.controller_name == page
	end
end
