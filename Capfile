require 'pry'
require "#{File.dirname(__FILE__)}/lib/helper"
# set :config, 'config/deploy/'

app_dir = select_applications
projects_config_path = 'config/projects'
set :config_root, "#{projects_config_path}/#{app_dir}"

#load deploy tasks
ARGV.find_index("-T")
if ARGV.find_index("-vT").nil?
  Dir["#{projects_config_path}/#{app_dir}/deploy_tasks/**/*.rb"].each do |rb_file|
    load rb_file
  end
else
  Dir["#{projects_config_path}/#{app_dir}/**/*.rb"].each do |rb_file|
    load rb_file
  end
end

require 'capistrano/multiconfig'
# load '/config/build_and_copy'
# Uncomment if you are using Rails' asset pipeline
# load 'config/deploy' # remove this line to skip loading any of the default tasks
# load 'config/custom_deploy'
# require "bundler/capistrano"

require "#{File.dirname(__FILE__)}/lib/build_and_copy"

