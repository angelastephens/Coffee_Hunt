require 'pry'

module CoffeeHunt
  class CoffeeShop

    @@all = []

    def self.all #access to the @@all array aka my getter method
      @@all
    end

    def self.load_by_location(location) # returns my array of coffee shops
      location_results = API.yelp_search("coffee shop", location) 
      if location_results != nil 
      @@all = self.create_from_results(location_results)
      else 
        @@all = []
      end
      # binding.pry
    end

    def self.create_from_results(location_results) #returns the collection of coffee shops
      location_results.map do |coffee_shop_hash|
        self.new(coffee_shop_hash)
      end
    end

    def self.find_by_number(n) # will return the coffee shop object
      @@all[n.to_i-1]
    end 
    
    def details #will display the information about the coffee shops
      <<-HEREDOC
#{self.name.colorize(:yellow)}
#{self.location["display_address"].join("\n")}
#{self.phone}
Rating:#{self.rating}    
      HEREDOC
    end
  
    attr_accessor :name, :rating, :location, :price, :phone #defines attributes that are readable and writeable

    def initialize(attributes={})
      # binding.pry
      attributes.each do |attribute_name,attribute_value|
        if self.respond_to?("#{attribute_name}=")
          self.send("#{attribute_name}=", attribute_value)
        end
      end
    end
  end

end
