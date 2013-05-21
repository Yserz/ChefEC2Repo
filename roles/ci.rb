name "ci"
description "ci server role"

default_attributes(
  :java => {
     :oracle => {
       "accept_oracle_download_terms" => true
     }
   },
   "java" => {
     "install_flavor" => "oracle"
   }
)
all_env = [ 
  "role[base]",
  "recipe[java]",
  "recipe[jenkins]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
  "test" => all_env,
)