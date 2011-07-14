require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "weibo"
    gem.summary = %Q{a gem to help api integration for 新浪微博 (t.sina.com.cn)}
    gem.description = %Q{this gem is an adaptation of John Nunemaker's Twitter gem.  I modified it to make api integration for 新浪微博 (t.sina.com.cn) easier.}
    gem.email = "ussballantyne@gmail.com"
    gem.homepage = "http://github.com/ballantyne/weibo"
    gem.authors = ["Scott Ballantyne"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency "oauth", "~> 0.4.1"
    gem.add_dependency "hashie"
    gem.add_dependency "httparty", ">= 0.5.2"
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
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "weibo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
