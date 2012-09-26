#CHANGE THIS PARAMETER
#name of the project/application
set :application, "example.com"

set :user, "sites" #this needs to change to www-data or some other none root user
#set :group, "www-data"

#CHANGE THIS PARAMETER
#domain to deploy to - this should be an IP address or hostname
set :domain, "xxx.xxx.xxx.xxx" 

set :scm, :none
set :repository, "#{File.expand_path('..')}" #use parent directory as this is in the deployment folder
set :deploy_to, "/home/sites/#{application}"
set :deploy_via, :copy
set :deploy_env, 'dist'

set :copy_remote_dir, deploy_to
set :copy_exclude, [".git", ".DS_Store", ".gitmodules", "build", "grunt.js", "assets", "staging", "production"]

set :use_sudo, false
set :keep_releases, 2

task :uname do
    run "uname -a"
end

namespace :h5bp do
    task :build do
        system("cd " + repository + " && yeoman build") or fail
    end
    task :clean do
        system("cd " + repository + " && yeoman clean") or fail
    end
end

task :cleanup do;
    if releases.length > 7
        logger.info "Too many releases, running deploy:cleanup."
        deploy.cleanup
    end
end;

before 'deploy', 'h5bp:build'
after 'deploy', 'h5bp:clean', :cleanup
