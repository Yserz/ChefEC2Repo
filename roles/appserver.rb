name "appserver"
description "App server role"

default_attributes(
  :java => {
     :oracle => {
       "accept_oracle_download_terms" => true
     }
   }
)
override_attributes(
  :java => {
    :install_flavor => "oracle"
  },
  :glassfish => {
    :domains => {
      "domain1" => {
        "config" => {
          "admin_port" => 4848,
          "username" => "admin",
          "password" => "password",
          "secure" => false,
          "max_stack_size" => 256,
          "terse" => true
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