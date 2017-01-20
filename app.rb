# coding: utf-8
require "sinatra"
require "sinatra/reloader"
require "json"

configure do
  set :bind, "localhost"
  set :port, 3000
end

post "/omise/webhook", provides: :json do
  req_data = JSON.parse(request.body.read.to_s)

  dir = File.join("log", "api", req_data["object"])
  filepath = File.join(dir, "#{req_data['id']}.json")
  # make directory
  FileUtils.mkdir_p(dir) unless FileTest.exist?(dir)
  # save JSON to text file
  File.open(filepath, "w") do |f|
    f.puts JSON.pretty_generate(req_data)
  end
end

get "*" do
  ":)"
end
