#CHANGE THIS PARAMETER
#name of the project/application
set :application, "website.com"

set :user, "root" #this needs to change to www-data or some other none root user
#set :group, "www-data"

#CHANGE THIS PARAMETER
#domain to deploy to - this should be an IP address. xxx.xxx.xxx.xxx
set :domain, "xxx.xxx.xxx.xxx" 

set :scm, :none
set :repository, "#{File.expand_path('.')}"
set :deploy_to, "/home/www/#{application}/html"
set :deploy_via, :copy
set :deploy_env, 'dist'

set :copy_remote_dir, deploy_to
set :copy_exclude, [".git", ".DS_Store", ".gitmodules", "build", "grunt.js", "assets"]

set :use_sudo, false
set :keep_releases, 2

task :uname do
  run "uname -a"
end

namespace :h5bp do
    task :build do
      system("h5bp")
    end
    task :clean do
        system('h5bp clean')
    end
end

task :cleanup do;
  if releases.length > 7
    logger.info "Too many releases, running deploy:cleanup."
    deploy.cleanup
  end
end;

before 'deploy', 'yeoman build'
after 'deploy', 'yeoman clean, :cleanup