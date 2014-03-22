$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cert2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cert2"
  s.version     = Cert2::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Cert2."
  s.description = "TODO: Description of Cert2."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_dependency "pg"

  s.add_dependency 'farm_tools'
  s.add_dependency 'twitter_express'

  s.add_dependency 'sass-rails', '~> 4.0.2'
  s.add_dependency 'bootstrap-sass', '~> 3.0.3.0'

  s.add_dependency 'koala'
  s.add_dependency 'devise'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-facebook'

  s.test_files = Dir["spec/**/*"]
end
