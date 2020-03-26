workers 1

threads 5, 5

work_dir = '/app/web_container'

environment 'production'

bind 'tcp://0.0.0.0:3000'

stdout_redirect "#{work_dir}/log/puma.stdout.log", "#{work_dir}/log/puma.stderr.log", true

pidfile "#{work_dir}/tmp/pids/puma.pid"
state_path "#{work_dir}/tmp/pids/puma.state"
activate_control_app

on_worker_boot do
  require 'active_record'
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{work_dir}/config/database.yml")['production'])
end
