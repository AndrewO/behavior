# begin
#   require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
# rescue LoadError
#   puts "You need to install rspec in your base app"
#   exit
# end
require 'rubygems'
require 'rspec'
require 'machinist'
# require 'rails'
require 'active_support'
require 'action_pack'
require 'action_controller'
require 'active_record'
require 'action_view'
require 'action_view/helpers'

$:.unshift(File.dirname(__FILE__) + "/../")

require 'lib/behavior'
require 'app/models/behavior_config'
require 'app/helpers/behavior_helper'

require File.dirname(__FILE__) + '/blueprints'

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
 
  db_adapter = ENV['DB']
 
  # no db passed, try one of these fine config-free DBs before bombing.
  db_adapter ||=
    begin
      require 'rubygems'
      require 'sqlite'
      'sqlite'
    rescue MissingSourceFile
      begin
        require 'sqlite3'
        'sqlite3'
      rescue MissingSourceFile
      end
    end
 
  if db_adapter.nil?
    raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3."
  end
 
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../rails/init.rb'
end

load_schema