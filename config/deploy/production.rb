server "#{domain}", :app, :web, :primary => true

set :repository, "#{repository}/production/"
set :deploy_to, "#{deploy_to}/production/"