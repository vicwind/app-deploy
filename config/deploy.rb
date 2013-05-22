require "bundler/capistrano"
# set :application, "set your application name here"
# set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
#
#

# set :config, './config'
# require 'capistrano/multiconfig'

# namespace :rvm do
  # desc 'Trust rvmrc file'
  # task :trust_rvmrc do
    # run "rvm rvmrc trust /tmp/pkgs/TireFinder/source/.rvmrc"
    # run "rvm rvmrc trust #{current_release}"
  # end
# end

# after "deploy:update_code", "rvm:trust_rvmrc"

# set :application, "TireFinder"
# app_servers = ['198.61.239.104', '50.57.95.199']
# set :build_server, '198.61.239.104'

# role :app, *app_servers
# role :web, *app_servers

# # set :gateway, '198.61.239.104'
# # set :app_hosts, app_servers
# set :deploy_to, "/home/innov_apps/apps/#{application}"

# default_run_options[:pty] = true
# default_run_options[:shell] = '/bin/bash --login'
# ssh_options[:forward_agent] = true

# # set :repository, "https://github.com/vicwind/app-deploy.git"  # Your clone URL
# set :repository, "git@github.com:WMTLabsInnov/TireFinder.git"  # Your clone URL
# set :scm, "git"
# # set :scm_passphrase, "p@ssw0rd"
# set :branch, "master"
# set :git_shallow_clone, 1
# set :use_sudo, false
# set :user, "innov_apps"
# set :deploy_via, "build_and_copy"

