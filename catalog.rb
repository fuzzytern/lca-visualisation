require 'sinatra'
require 'haml'
require 'sass'
require_relative 'api'

# Sinatra configuration 
configure do
  set :haml, :format => :html5
end

###############################
#   RESTful Request handling
###############################

get '/' do
  @catalog = Hypertopic.get_url '/'
  haml :catalog
end
