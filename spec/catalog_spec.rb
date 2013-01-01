require File.dirname(__FILE__) + '/spec_helper'
 
describe "Catalog Test" do
  include Rack::Test::Methods
 
  def app
    @app ||= Sinatra::Application
  end
 
  # Do a root test
  it "displays the catalog" do
    get '/'
    last_response.should be_ok
    last_response.body.should contain('Liste des produits')
  end
end
