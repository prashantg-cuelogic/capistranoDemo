set :application, "capistrano test"
set :repository,  "https://github.com/prashantg-cuelogic/capistranoDemo.git"

set :user, 'root'
set :scm, :git
set :deploy_to, "/var/www/html/projects/capistrano"
set :branch, "master"

set :deploy_via, :copy
set :use_sudo, false
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules", "Capfile", "config/deploy.rb"]
server "50.17.210.146",:app, :web, :db, :primary => true
set :ssh_options, { :forward_agent => true}
ssh_options[:keys] = %w(/opt/lampp/htdocs/capistranoDemo/cuelogic.pem)
set :keep_releases, 5
#ssh-keygen -t rsa -C "prashant@cuelogic.co.in"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "Apache"                          # Your HTTP server, Apache/etc
#role :app, "Apache"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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