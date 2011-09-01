# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tweet_sentiment/version"

Gem::Specification.new do |s|
  s.name        = "tweet_sentiment"
  s.version     = TweetSentiment::VERSION
  s.authors     = ["Zac Clark", "Ryan Wanger"]
  s.email       = ["hi@zacclark.com", "ryanwanger@gmail.com"]
  s.homepage    = ""
  s.summary     = "WOOPS"
  s.description = "This gem does some sweet thit"

  s.rubyforge_project = "tweet_sentiment"

  s.files = Dir["{lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  # Development Dependencies
  s.add_development_dependency "bundler"  , "~> 1.0.0"
  s.add_development_dependency "minitest" , "~> 2.2.2"
end
