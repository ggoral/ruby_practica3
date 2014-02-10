helpers do

  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

  def options_path(path, resource_id = ':resource_id', booking_id = ':booking_id')
    hash_path = {
      "resource" => "#{base_url}/resources/#{resource_id}",
      "resources" => "#{base_url}/resources",
      "resource_availability" => "#{base_url}/resources/#{resource_id}/bookings",
      "resource_bookings" => "#{base_url}/resources/#{resource_id}/bookings",
      "resource_bookings_booking" => "#{base_url}/resources/#{resource_id}/bookings/#{booking_id}",
    }
    hash_path[path]
  end

  def link_path(path, rel=:self, method=nil)
    link = {rel: rel, uri: url(path) }
    if method then link[:method] = method end
    link
  end

  def resource_links(resource)
    links = [] << link_path(options_path("resource",resource.id))
    links << link_path(options_path("resource_bookings",resource.id),:bookings)
    links
  end

  def resources_links(resources)
    links = [] << link_path(options_path("resources"))
    links
  end
  
end