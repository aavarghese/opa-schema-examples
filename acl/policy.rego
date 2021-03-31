package policy

import data.acl
import input

# First rule comment with no metadata
default allow = false

# Second rule comment with metadata
# METADATA
# scope: rule
# schemas:
#   - input: schema["input"]
#   - data.acl: schema["acl-schema"]
allow {
        access = data.acl[input.user]
        access[_] == input.operation
        input.foo
}

# Third rule comment with metadata
# METADATA for whocan rule
# scope: rule
# schemas:
#   - input: schema["whocan-input-schema"]
#   - data.acl: schema["acl-schema"]
whocan[user] {
        access = acl[user]
        access[_] == input.operation
}