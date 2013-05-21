#Environments
This directory is for Ruby DSL and JSON files for environments. For more information see the Chef wiki page:

http://wiki.opscode.com/display/chef/Environments

#Upload the environments to the Chef server:
use the following command to upload the environments from the chef-workstation to the chef-server:
`knife environment from file dev.rb`
`knife environment from file prod.rb`
and
`knife environment from file test.rb`