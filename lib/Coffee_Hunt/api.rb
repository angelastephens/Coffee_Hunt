require 'open-uri'
require 'json'
require 'http'

module CoffeeHunt

  class API

    API_HOST = "https://api.yelp.com"
    SEARCH_PATH = "/v3/businesses/search"
    BUSINESS_PATH = "/v3/businesses/" 

    def self.api_key 
      begin
        @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip
      rescue 
        puts "Uh Oh! Looks like you are missing your Yelp API key! You can sign up for a new key and enter it or exit the CLI."
        @@key = gets.strip 
        return if @@key == "exit"
          File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
          file.print @@key
        end
      end
      @@key

    end

    def self.yelp_search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
      term: term,
      location: location
      }
      response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
  
      JSON.parse(response)["businesses"]       
    end

  end

end