
@resource = Hashie::Mash.new(id: 1,
                               name: "Computadora",
                               description:"Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux")

@resource.links = [Hashie::Mash.new(id:1 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/1")]

resources = []

