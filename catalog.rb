require 'sinatra'
require 'haml'

###############################
#   RESTful Request handling
###############################

get '/' do
  #@catalog = 
  haml :catalog
end
