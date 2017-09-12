module ApplicationHelper
	def error_messages_for(*params)
		options = params.extract_options!.symbolize_keys
		objects = params.collect { |name| instance_variable_get("@#{name}") }
		error_messages = objects.map { |o| o.full_messages }
		unless error_messages.flatten!.empty?
			if options[:partial]
				render partial: options[:partial], locals: { errors: error_messages }
			else
				header = "Se produjeron los siguientes errores:"
				error_list = error_messages.map { |m| content_tag(:li, m) }
				contents = ''
				contents << content_tag(:h2, header)
				contents << content_tag(:ul, error_list)
				content_tag(:div, contents, class: 'errorExplanation', id: 'errorExplanation')
			end
		else
			''
		end
	end
end
