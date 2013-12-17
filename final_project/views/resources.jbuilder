# Place this file in the `views` directory.

 
json.resources @resources do |json, resource|
    json.(resource, :name, :description)

    json.links resource.links do |link|
      json.(link, :rel, :uri)
    end
end

json.links @links do |json, link|
  json.rel "self"
  json.uri edit_resource_url(@resource)
end