package kubernetes.admission                                                

deny[msg] {                                                                
  input.request.kind.kinds == "Pod"                       # This line has a typo, should be input.request.kind.kind                      
  image := input.request.object.spec.containers[_].image                    
  not startswith(image, "hooli.com/")                                       
  msg := sprintf("image '%v' comes from untrusted registry", [image])       
}
