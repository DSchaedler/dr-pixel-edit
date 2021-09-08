require 'app/require.rb'

def tick(args)
  $app ||= PE::App.new # rubocop:disable Style/GlobalVars
  $app.tick(args) # rubocop:disable Style/GlobalVars
end
