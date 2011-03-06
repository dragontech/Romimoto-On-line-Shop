if Spree::Config.instance 
  Spree::Config.set( :default_locale => 'ro' ) 
end 

LOCALES_DIRECTORY = "#{RAILS_ROOT}/config/locales/"

LANGUAGES =[
  ['Romana', 'ro'],
  ['English', 'en'],
  ['Deutsch', 'de'],
  ['Magyar', 'hu']
]
