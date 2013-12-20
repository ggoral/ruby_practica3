# Place this file in the `views` directory.

 
json.resources @resources do |resource|
    json.(resource, :name, :description)

    json.links resource.links do |link|
      json.(link, :rel, :uri)
    end
end

json.links @links do |link|
  json.rel "self"
  json.uri edit_resources_url
end