# configure rails envinronment
ENV["RAILS_ENV"] = "test"

require 'rails'
require "rails/test_help"

# for generators
require 'rails/generators/test_case'

def copy_routes
  routes = File.expand_path "../support/routes.rb", __FILE__
  destination = File.join destination_root, "config"

  FileUtils.mkdir_p destination
  FileUtils.cp routes, destination
end
