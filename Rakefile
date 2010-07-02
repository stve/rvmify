require 'rubygems'
require 'rake'

$LOAD_PATH.unshift 'lib'

begin
  require 'jeweler'
  require 'rvmify'
  Jeweler::Tasks.new do |gem|
    gem.name = "rvmify"
    gem.summary = %Q{get up and running quickly with rvm, gemsets and bundler}
    gem.description = %Q{get up and running quickly with rvm, gemsets and bundler}
    gem.email = "steve.agalloco@gmail.com"
    gem.homepage = "http://github.com/spagalloco/rvmify"
    gem.authors = ["Steve Agalloco"]
    gem.version = RVMify::VERSION
    gem.bindir = 'bin'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rvmify #{RVMify::VERSION}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
