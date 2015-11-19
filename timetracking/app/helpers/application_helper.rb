module ApplicationHelper

	def hours_counter(project, date)
		project.total_hours_in_month(date.month, date.year).round(2)	
	end

	def flash_message
		flash_display(:alert) || flash_display(:notice)
	end
	
	private

	def flash_display(type)
		if flash[type]
			content_tag :div, class: type do
				content_tag :p do
					flash[type]
				end
			end
		end
	end

end
				


