require 'ext/json'
require 'httparty'
require 'sinatra'
require 'sinatra/json'


###############################
#   Class Definitions
###############################
class Hypertopic
  include HTTParty
  base_uri 'http://localhost:5984/argos'

  def initialize(auth)
    @auth = auth
  end

  def to_json(*a)
  end
end

###############################
#   RESTful Request handling
###############################

get '/:uuid' do
  puts "**** get element with id #{params[:uuid]}"
  element = Hypertopic.get(params[:uuid])
  if element.nil?
    status 404
  else
    status 200
    json element 
  end
end
