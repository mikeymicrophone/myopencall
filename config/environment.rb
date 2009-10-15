# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'authlogic'
  config.gem 'andand'
  config.gem 'paperclip'
  config.gem 'haml'
  config.gem 'wysihat-engine'
  config.gem 'notahat-machinist',
   :lib => 'machinist',
   :source => 'http://gems.github.com'
  
  config.time_zone = 'UTC'
end