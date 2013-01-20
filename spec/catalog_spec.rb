require File.dirname(__FILE__) + '/spec_helper'
require_relative '../lib/api'

 

describe 'GET /products' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before(:all) do
    Hypertopic.put "/test" # creates the test db
  end

  after(:all) do
    Hypertopic.delete "/test" # deletes the test db
  end

  before (:each) do
    @title = "Projet TX"
    @product_id = "product1"
    @product_name = "BambooLine"

    Hypertopic.put "test/_design/#{@product_id}", :body => {
      :_id => @product_id,
      :type => "product",
      :name => "BambooLine",
      :category => "pen",
      :brand => "TerraPen"}.to_json,
      :headers => { 'Content-Type' => 'application/json' }
  end

  it "should display the catalog" do
    get '/'
    last_response.should be_ok
    last_response.body.should include(@title)
  end

  it "should access a product's data" do
    get "/products/#{@product_id}"
    last_response.should be_ok
    last_response.body.should include(@product_name)
  end
end
