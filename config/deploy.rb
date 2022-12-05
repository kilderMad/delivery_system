# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, 'deliverysystemapp'
set :repo_url, 'https://github.com/killer-cf/delivery_system.git'
set :deploy_to, '/var/www/deliverysystemapp'
set :rvm_custom_path, "/usr/share/rvm"
set :branch, 'main'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

after 'deploy:finished', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end
