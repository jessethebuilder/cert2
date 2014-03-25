module Cert2
  #require 'rubygems'
  #require 'devise'
  #require 'omniauth'
  #require 'omniauth-facebook'

  class Engine < ::Rails::Engine
    #isolate_namespace EngineWithMigrations

    #middleware.use OmniAuth::Builder do
    #  provider :facebook, FB_ID, FB_SECRET
    #end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    #Includes engine migrations in app migrations.
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end