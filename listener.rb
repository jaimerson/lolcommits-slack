require 'listen'
require 'httparty'
require 'dotenv'

Dotenv.load
path = ENV['LOLCOMMITS_REPO_IMAGES']

listener = Listen.to(path) do|modified, added|
  puts "#{added}"
end

puts "Started listening on #{path}."
listener.start
sleep
