server "#{domain}", :app, :web, :primary => true

set :repository, "#{repository}/staging/"
set :deploy_to, "#{deploy_to}/staging/"