resource_1 = Hashie::Mash.new(id: 1,
                               name: "Computadora",
                               description:"Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux")

resource_1.links = [Hashie::Mash.new(id:1 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/1")]


resource_2 = Hashie::Mash.new(id: 2,
                               name: "Monitor de 24 pulgadas SAMSUNG",
                               description:"Monitor de 24 pulgadas SAMSUNG")

resource_2.links = [Hashie::Mash.new(id:2 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/2")]


resource_2 = Hashie::Mash.new(id: 2,
                               name: "Monitor",
                               description:"Sala de reuniones con máquinas y proyector")

resource_2.links = [Hashie::Mash.new(id:2 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/2")]

resource_3 = Hashie::Mash.new(id: 3,
                               name: "Sala de reuniones",
                               description:"Sala de reuniones con máquinas y proyector")

resource_3.links = [Hashie::Mash.new(id:3 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/3")]

$resources = [resource_1,resource_2,resource_3]
