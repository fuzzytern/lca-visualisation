require File.join(File.dirname(__FILE__), '..', 'catalog.rb')

set :environment, :test
 
require 'rubygems'
require 'bundler'
require 'sinatra'
require 'rspec'
require 'rack/test'
 
