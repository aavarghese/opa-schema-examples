# opa-schema-examples

A new feature allows Rego's type system to take into account the schemas for input documents. This adds precision to type checking and helps prevent errors when writing Rego code. It helps users by rejecting erroneous code statically and improving developer productivity. It uses JSON Schema as the format for providing schemas.

This repo contains example files to illustrate the new feature.

## How to run

We added a new query argument to `opa eval` to support uploading of a single schema for the input document in JSON Schema format.

```
-s, --schema string set schema file path
```

## Examples


```
opa eval --format pretty data.example.public_server -i opa-example/input.json -d opa-example/example.rego -s opa-example/input-schema.json
```

```
opa eval --format pretty data.kubernetes.admission.deny -i kubernetes/admission-review.json -d kubernetes/pod.rego -s kubernetes/admission-schema.json
```

```
opa evak --format pretty data.terraform.analysis.authz -i terraform/tf-plan.json -d terraform/terraform.rego -s terraform/tf-schema.json
```
