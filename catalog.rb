require 'sinatra'
require 'haml'

###############################
#   RESTful Request handling
###############################

get '/' do
  haml :catalog
end
