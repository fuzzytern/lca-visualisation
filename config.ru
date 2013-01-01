require './catalog'
require 'sass/plugin/rack'

# use sass for stylesheets
Sass::Plugin.options[:style] = :nested
use Sass::Plugin::Rack

run Sinatra::Application
