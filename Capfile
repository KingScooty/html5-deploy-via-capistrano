require 'rubygems'
require 'railsless-deploy'

set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

load 'config/deploy.rb' if respond_to?(:namespace)