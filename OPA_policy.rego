package main

default allow = false

# Define allowed environment names
allowed_environments = {"dev", "prod", "staging"}

# Resource naming conventions
naming_conventions = {
    "virtual_network": "vn-[a-z]+[0-9]*",
    "storage_account": "sa-[a-z]+[0-9]*",
    "resource_group": "[a-z]+[0-9]*-rg"
}

# Check if a resource follows naming conventions
valid_name(resource, convention) {
    re_match(convention, resource)
}

# Check if an environment is allowed
valid_environment(env) {
    env == "common"   # Allow a common environment
    env == allowed_environments[_]
}

# Allow resources that follow naming conventions
allow {
    resource_type = input.resource.type
    convention = naming_conventions[resource_type]
    valid_name(input.resource.name, convention)
}

# Allow resources in allowed environments
allow {
    environment = input.resource.environment
    valid_environment(environment)
}
