root = "/var/www/deliverysystemapp/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"
worker_processes 4
timeout 30
preload_app true
listen '127.0.0.1:3040'
#listen '/tmp/deliverysystemapp.sock', backlog: 64
