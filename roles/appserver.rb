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
  "recipe[glassfish::attribute_driven_domain]",
]
override_attributes(
  :glassfish => {
    :domains => {
      "domain1" => {
        "config" => {
          "admin_port" => 4848
        }
      }
    }
  }
)
run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
  "test" => all_env,
)