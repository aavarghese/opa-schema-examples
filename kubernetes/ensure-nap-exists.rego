package example

import data.kubernetes.networkpolicies

deny[networkpolicy] = type {
	input.request.kind.kind == "Pod"
    np_label_value := {v["app"] | v := networkpolicies[_].spec.podSelector.matchLabels}
    networkpolicy := networkpolicies[_]
    type = type_name(networkpolicy)
}
contains_label(arr,val){
	arr[_] == val
}