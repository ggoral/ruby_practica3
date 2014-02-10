
#primero habria que convertir un recurso a json
def resource_to_json(resource)
  { resource: resource_to_hash(resource, {bookings: true}) }.to_json
end

def resource_to_hash(resource, options = {})
  links = [] << link(resource(resource.id))
  links << link(bookings_resource_path(resource.id), :bookings) if options[:bookings]

  {name: resource.name, description: resource.description, links: links}
end
