require 'listen'
require 'httmultiparty'
require 'dotenv'

Dotenv.load
path = ENV['LOLCOMMITS_REPO_IMAGES']
token = ENV['SLACK_TOKEN']

listener = Listen.to(path) do |modified, added|
  file = added.first
  if file
    options = { file: File.new(file) }
    HTTMultiParty.post("https://slack.com/api/files.upload?token=#{token}",
                       body: options)
    puts "Uploading #{file} to slack..."
  end
end

puts "Started listening on #{path}"
listener.start
sleep
