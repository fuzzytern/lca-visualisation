require 'json/ext'
require 'httparty'


class Hypertopic
  include HTTParty
  base_uri 'http://localhost:5984/argos'

  def self.rest_database(uri)
    base_uri uri
  end

  def self.get_url(path)
    "#{base_uri}#{path}"
  end

  def self.get_all(query)
    self.class.get('/_all_docs')
    # - TODO
  end

  ## Update the attributes of an element
  #def put(json)
  #  Hypertopic.put(@db, json)
  #end

  ## Add an element to the database
  ## will give you back an id
  #def post(json)
  #  Hypertopic.post(@db, json)
  #end

  #def delete(json)
  #  Hypertopic.delete(@db, json)
  #end
end

