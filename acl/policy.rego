package policy

import data.acl
import input

default allow = false

#@rulesSchema=data.acl:schemas.acl-schema
allow {
        access = data.acl[input.user]
        access[_] == input.operation
}

#@rulesSchema=input:schemas.whocan-input-schema,data.acl:schemas.acl-schema
whocan[user] {
        access = acl[user]
        access[_] == input.operation
        input.user
}