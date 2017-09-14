module ApplicationHelper
	def error_messages_for(*params)
		options = params.extract_options!.symbolize_keys
		objects = params.collect { |name| instance_variable_get("@#{name}") }
		error_messages = objects.map { |o| o.errors.full_messages }
		unless error_messages.flatten!.empty?
			if options[:partial]
				render partial: options[:partial], locals: { errors: error_messages }
			else				
				error_list = ''.html_safe
				error_messages.map do |m| 
					error_list += content_tag(:li, m).html_safe
				end
				contents = ''.html_safe
				contents << content_tag(:h2, "Se produjeron los siguientes errores:")
				contents << content_tag(:ul, error_list)
				content_tag(:div, contents, class: 'errorExplanation', id: 'errorExplanation')
			end
		else
			''.html_safe
		end
	end
end
