name "appserver"
description "App server role"

default_attributes(
   "java" => {
     "install_flavor" => "oracle"
   }
)
override_attributes(
  :java => {
    :oracle => {
      "accept_oracle_download_terms" => true
     }
   }
 )
override_attributes(
  :glassfish => {
    :domains => {
      "domain1" => {
        "config" => {
          "admin_port" => 4848,
          "username" => "admin",
          "password" => "password",
          "secure" => true,
          "max_stack_size" => 256
        }
      }
    }
  }
)
all_env = [ 
  "role[base]",
  "recipe[java]",
  "recipe[glassfish::attribute_driven_domain]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
  "test" => all_env,
)