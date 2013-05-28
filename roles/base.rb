name "base"
description "Base role applied to all nodes."
#"recipe[users::sysadmins]",
run_list(
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[git]",
  "recipe[build-essential]",
  "recipe[vim]"
) 
override_attributes(
  :authorization => {
    :sudo => {
      :users => ["ubuntu", "vagrant"],
      :passwordless => true
    }
  }
)
override_attributes(
  :java => {
    :oracle => {
      "accept_oracle_download_terms" => true
    }
  }
)