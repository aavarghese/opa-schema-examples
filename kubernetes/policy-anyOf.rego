package kubernetes.admission                                                

default deny = true 

# METADATA
# scope: rule
# schemas: 
#   - input: schema["input-anyOf"]
deny {                                                                
  input.request.servers.versions == "Pod"                       # This line has a typo, could be input.request.server.accessNum or input.request.kind.kind
}

#End of file