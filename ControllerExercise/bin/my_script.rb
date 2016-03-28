require 'addressable/uri'
require 'rest-client'
def create_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3'
  ).to_s

  #puts RestClient.get(url)

  begin
    puts RestClient.delete(url)
  rescue RestClient::Found
    puts RestClient.get(url[0..-2])
  end
end

create_user
