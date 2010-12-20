require 'rake'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--colour --format progress']
  t.pattern = 'spec/**/*_spec.rb'
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'app/**/*',
  'generators/**/*',
  'config/*',
  'lib/**/*',
  'rails/**/*',
  'spec/**/*',
  'features/**/*'
]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "behavior"
    s.version = "0.2.0"
    s.author = "Paul Campbell"
    s.email = "paul@rslw.com"
    s.homepage = "http://www.github.com/paulca/behavior"
    s.platform = Gem::Platform::RUBY
    s.summary = "A Rails plugin for storing application configuration in the database."
    s.files = PKG_FILES.to_a
    s.require_path = "lib"
    s.has_rdoc = false
    s.extra_rdoc_files = ["README.textile"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Jeweler::GemcutterTasks.new