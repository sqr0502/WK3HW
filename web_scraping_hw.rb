# Build your own stock ticker web scraping program. Every time you run it, you should get the current price for AAPL.
#
# As a bonus, additional features to consider include:
#
# Format the price to look like a money value.
# Allow the user to specify a stock symbol.
# Display additional data about the stock, like the previous close price.


require "httparty"
require "nokogiri"
require "yahoo_stock"


def user_input(string)
  puts string
  user_input = gets.chomp.to_s
end


def prev_close(user_choice, symbol)

  testh = {:stock_symbol => symbol,
          :start_date => Date.today - 1,
          :end_date => Date.today-1}

  if user_choice == 'y' || user_choice == "yes"
    history = YahooStock::History.new(testh)
  end
  history = history.results(:to_array).output
end

symbol = user_input("Enter stock symbol: ")

quote = YahooStock::Quote.new(:stock_symbols => [symbol])

quote = quote.results(:to_array).output
puts quote

user_choice = user_input("Would you like the close for the previous day? (Y)es or (N)o")


history = prev_close(user_choice, symbol)
puts history[0][0]
puts history[0][4]
