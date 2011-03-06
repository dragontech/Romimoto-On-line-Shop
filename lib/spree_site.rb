require 'site_hooks' 
module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Product.class_eval do
        globalize_accessors *LANGUAGES.collect{|lang| lang[1].to_sym}
      end

      Taxon.class_eval do
        globalize_accessors *LANGUAGES.collect{|lang| lang[1].to_sym}
      end
    end
    config.to_prepare &method(:activate).to_proc
  end
end
