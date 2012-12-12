require 'json/ext'
require 'httparty'

@db = "http://localhost:5984/argos"

class Hypertopic
  include HTTParty
  base_uri 'http://localhost:5984/argos'
end

def rest_database(base_url)
  @db = base_url
end

def get_url
  @db
end

def get_url(path)
  # - TODO
end

def get_all(query)
  # - TODO
end

# Update the description of a proposal, replace title
# or description
def put(json)
  Hypertopic.put(@db, json)
end

# Add an element to the database, title and description
# will give you back an id
def post(json)
  Hypertopic.post(@db, json)
end

def delete(json)
  Hypertopic.delete(@db, json)
end
