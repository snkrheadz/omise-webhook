# coding: utf-8
require "sinatra"
require "sinatra/reloader"
require "json"
require "omise"
require "dotenv"
Dotenv.load
# set your omise test api key
# https://dashboard.omise.co/test/api-keys
Omise.api_key = ENV["OMISE_TEST_SECRET_KEY"]
Omise.api_version = "2015-11-17"

configure do
  set :bind, "localhost"
  set :port, 3000
end

post "/omise/webhook", provides: :json do
  # retrieve the request's body and parse it as JSON
  event_json = JSON.parse(request.body.read)
  # verify the event by fetching it from Omise
  event = Omise::Event.retrieve(event_json["id"])

  dir = File.join("log", "api", event["object"])
  filepath = File.join(dir, "#{event['id']}.json")

  # make directory to save api response as JSON file
  FileUtils.mkdir_p(dir) unless FileTest.exist?(dir)

  # save api response as JSON file
  File.open(filepath, "w") do |f|
    f.puts JSON.pretty_generate(event.as_json)
  end
end

get "*" do
  ":)"
end
