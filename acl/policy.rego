package policy

import data.acl
import input

# First rule comment with no metadata
default allow = false

# Second rule comment with metadata
# METADATA
# type: rule
# schemas:
#   - data.acl: schemas.acl-schema
allow {
        access = data.acl[input.user]
        access[_] == input.operation
}

# Third rule comment with metadata
# METADATA for whocan rule
# type: rule
# schemas:
#   - input: schemas.whocan-input-schema
#   - data.acl: schemas.acl-schema
whocan[user] {
        access = acl[user]
        access[_] == input.operation
}