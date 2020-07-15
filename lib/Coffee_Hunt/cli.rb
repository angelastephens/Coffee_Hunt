require 'pry'
require 'colorize'

module CoffeeHunt

  class CLI

    def initialize 
      @input = " "
    end

    def start_hunt
      puts "Welcome to Coffee Hunt CLI! ".colorize(:blue).bold
      # puts "Please start by entering your location so we can give you coffee shop suggestions!"
      # binding.pry
      pick_location
      list_coffee_shops
      make_a_selection
      while @input != "exit"
        if valid?
          @coffee_shop= CoffeeShop.find_by_number(@input)
          puts @coffee_shop.details
          puts "Smells like a great brew!".colorize(:green).bold
        else
          puts "That was a bad coffee bean! Please try another?".colorize(:red).bold
        end
        make_a_selection
      end
    end 
      
    def pick_location 
      puts "So we can help you find a tasty caffinated beverage, please enter your location."
      @location = gets.chomp
      CoffeeShop.load_by_location(@location)
    end

    def valid?
      @input.to_i.between?(1,CoffeeShop.all.length)
    
    end


    def list_coffee_shops
      CoffeeShop.all.each.with_index(1) do |coffee,index|
        # binding.pry
        puts "#{index}. #{coffee.name}"
      end
    end

    def list_options
      puts "Please select a coffee shop by number so you can receive more information!"
      puts "If you wish to exit please type 'exit!'"
      puts "If you would like to return to the list of Coffee Shops then Enter 'back'."

    end

    def make_a_selection
      list_options
      @input = gets.strip
    end




  end
    
end