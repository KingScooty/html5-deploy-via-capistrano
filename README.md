#Deploy html5 and php sites via Capistrano

**This project requires the user to have root access to their server (VPS) and to have already setup Apache/nginx on it. It also requires [yeoman.io](http://yeoman.io) to be installed, as the build process is delegated.**

##Setting up

1. Run the following from the terminal:
```
gem install capistrano ;
gem install railsless-deploy
```
2. Download this project to your root folder (ensure `config` folder and `Capfile` are in the project root).
3. Open `config/deploy.rb`
4. Change line 3 `set :application, "website.com"` to whatever the app is called
5. Change line 10 `set :domain, "xxx.xxx.xxx.xxx"` to the IP of your VPS.
***5.1 You will require an SSH key to have been setup prior to this step***
6. This script deploys to `"/home/www/#{application}/html"` by default*

*A production folder and staging folder will be created in this deploy dir to enable a staging domain for testing, and a production domain for production ready code.* ***Please ensure your VPS is configured, and hosts file matches deploy locations.***

##Deploying

###Default behaviour
Run `capistrano deploy` to deploy. Capistrano will build the project using yeoman, and then deploy to staging by default.

###Production
You can overwrite the default behaviour by typing `capistrano deploy:production`, which will build, then deploy to production.