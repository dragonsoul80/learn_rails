module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Toan Tang"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end

def current_page?(options)
   unless request
     raise "You cannot use helpers that need to determine the current "
     "page unless your view context provides a Request object "
     "in a #request method"
   end

   return false unless request.get? || request.head?

   url_string = URI.parser.unescape(url_for(options)).force_encoding(Encoding::BINARY)

   # We ignore any extra parameters in the request_uri if the
   # submitted url doesn't have any either. This lets the function
   # work with things like ?order=asc
   request_uri = url_string.index("?") ? request.fullpath : request.path
   request_uri = URI.parser.unescape(request_uri).force_encoding(Encoding::BINARY)

   if url_string =~ /^\w+:\/\//
     url_string == "#{request.protocol}#{request.host_with_port}#{request_uri}"
   else
     url_string == request_uri
   end
 end
