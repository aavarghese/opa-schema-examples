package kubernetes.admission                                                

#@rulesSchema=input:data.schemas.kubernetes.admission,input.request.object:data.schemas.kubernetes.pod
deny[msg] {                                                                
  input.request.kind.kinds == "Pod"                               
  image := input.request.object.spec.containers[_].image                    
  #input.request.object.blah
  not startswith(image, "hooli.com/")                                       
  msg := sprintf("image '%v' comes from untrusted registry", [image])       
}
