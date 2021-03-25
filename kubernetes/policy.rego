package kubernetes.admission                                                

# METADATA
# scope: rule
# schemas: 
#   - input: schema["input"]
#   - input.request.object: schema.kubernetes["pod"]
deny[msg] {      
  input.boo                                                          
  input.request.kind.kinds == "Pod"                       # This line has a typo, should be input.request.kind.kind
  image := input.request.object.spec.containers[_].image                    
  not startswith(image, "hooli.com/")                                       
  msg := sprintf("image '%v' comes from untrusted registry", [image])       
}

#End of file