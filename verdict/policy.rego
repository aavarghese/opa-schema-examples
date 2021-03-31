package data.authz

import data.kubernetes.assets


verdict[output] {
    count(rule)==0
    output = {"name": "Deny by default", "action": "Deny"}
}

verdict[output] {
    count(rule)>0
    output = rule[_]
}

rule[{"name": "Allow for fraud detection", "action": "Allow"}] {
    input.request.operation = "READ"
    input.request.purpose = "Fraud Detection"
}

rule[{"name": "Redact PII columns for CBA", "action": "RedactColumn", "columns": columns}] {
    input.request.operation = "READ"
    input.request.purpose = "CBA"
    asset := assets[input.request.asset.namespace][input.request.asset.name]
    columns = [c | asset.spec.schema[i].tags[_] == "PII"; c := asset.spec.schema[i].name]
}