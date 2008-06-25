require 'mongrel_cluster/recipes'

default_run_options[:pty] = true

set :application, "Keeper"
set :repository,  "git@github.com:alexjo/keeper.git"

set :use_sudo, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/alex/www/vhosts/jox.la/#{application}"
# set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, "git"
set :scm_passphrase, "p00p!"
set :user, "alex"
set :deploy_via, :remote_cache

role :app, "alex@starkast.net"
role :web, "alex@starkast.net"