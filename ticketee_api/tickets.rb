require "httparty"

token = "08e1029a88caaa6d7951f3f0180f1b75"
url = "http://localhost:3000/api/projects/1/tickets/1.json"

response = HTTParty.get(
  url, headers: { "Authorization" => "Token token=#{token}" }
)

puts response.parsed_response
