require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :dev do
  require_relative 'lib/generamba'
  puts ARGV
  Generamba::CLI::Application.start(ARGV)
end