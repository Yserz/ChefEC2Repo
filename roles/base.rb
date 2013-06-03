name "base"
description "Base role applied to all nodes."
#
run_list(
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[git]",
  "recipe[build-essential]",
  "recipe[vim]",
  "recipe[htop]"
) 
## Configure /etc/sudoers
override_attributes(
  :authorization => {
    :sudo => {
      #:groups => ["sysadmin", "wheel", "admin", "glassfish-admin"],
      #:users => ["ubuntu"],
      #:passwordless => true,
      :sudoers_defaults => ['env_reset', 'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'],
      :include_sudoers_d => true
    }
  }
)