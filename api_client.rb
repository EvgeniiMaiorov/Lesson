require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter Faraday.default_adapter
  config.token_auth('e4b15bd7781b58118b00ab7b638d9407')
end

response = client.delete do |req|
  req.url '/api/v1/books/4'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status
