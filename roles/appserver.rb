name "appserver"
description "App server role"

default_attributes(
  "java" => {
    "install_flavor" => "oracle"
  }
)
all_env = [ 
  "role[base]",
  "recipe[java]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
  "test" => all_env,
)