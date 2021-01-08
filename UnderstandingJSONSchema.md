# Understanding JSON Schema

## JSON properties (and support in OPA's type check)
1. Type specific keywords:
  - type: string 
  - type: integer, number
  - type": null 
  - type: boolean
  - type: object has `properties` field, `additionalProperties` field, `dependencies` field, `patternProperties` field
  - type: array has `items`, `additionalItems`, and `contains`
  - Regex: `patternProperties` field

2. Combining schemas (https://json-schema.org/understanding-json-schema/reference/combining.html)
 - allOf: Must be valid against all of the subschemas
 - anyOf: Must be valid against any of the subschemas
 - oneOf: Must be valid against exactly one of the subschemas
 - not: Must not be valid against the given schema

3. Enum

4. If/then/else

5. $ref elements