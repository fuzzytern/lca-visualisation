require File.dirname(__FILE__) + '/spec_helper'
 

describe 'GET /products' do
  include Sinatra::Test

  before(:all) do
    Httparty.put "/test" # creates the test db
  end

  after(:all) do
    Httparty.delete "/test" # deletes the test db
  end

  before (:each) do
    @title = "Projet TX"
    @product_id = "product1"
    @product_name = "BambooLine"

    HTTParty.put "test/_design/#{@product_id}", {
      :_id => @product_id,
      :type => "product",
      :name => "BambooLine",
      :category => "pen",
      :brand => "TerraPen"}.to_json,
      :content_type => 'application/json'
  end

  it "should display the catalog" do
    get '/'
    response.should be_ok
    response.should have_selector("h1", :content => @title)
  end

  it "should access a product's data" do
    get "/products/#{@product_id}"
    response.should be_ok
    response.should have_selector("li", :content => @product_name)
  end
end
