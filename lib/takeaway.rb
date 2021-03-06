require 'bundler/setup'
require 'twilio-ruby'
require_relative 'twilio_credentials'

class Takeaway

	def initialize(menu)
		@menu = menu
		# @order = nil
	end

	def menu
		@menu
	end

	def how_to_order?
		print "Here's an example of how to order: \nkorma 2 madras 1 rice 3"
	end

	def order
		@order
	end

	def place_order(ordered_food, money)
		read_order = check_order(ordered_food)
		quantities = check_order_quantities(read_order)
		order = check_order_against_menu(read_order)

		argument_error if order_price(order, quantities) != money
		send_confirmation
	end

	def argument_error
		raise(ArgumentError, "That is the wrong amount! Please try again")
	end

	def check_order(order)
		order = order.split(' ')
		order = organise_order(order).each_slice(2).to_a
	end

	def organise_order(order)
		order.map do |dish| 
			if dish.match(/\d/)
				dish.to_i
			else
				dish.capitalize
			end
		end
	end

	def check_order_against_menu(order)
		order_matches_menu =
		order.map do |ordered_dish|
			menu.food_items.select do |menu_item|
				ordered_dish[0] == menu_item.name
			end
		end
		order_matches_menu.flatten
	end

	def check_order_quantities(order)
		order_quantities = []

		order.each do |dish|
			order_quantities << dish[1]
		end
		order_quantities
	end

	def order_price(order, quantities)
		food_price = order.map {|dish| dish.price}
		price_per_item(food_price, quantities)
	end

	def price_per_item(food_price, quantities)
		price_per_item = []
		price_per_item = [food_price, quantities].transpose
		calculate_order_total(price_per_item)
	end

	def calculate_order_total(price_per_item)
		total_per_item = []
		price_per_item.each do |dish|
			total_per_item << dish[0]*dish[1]
		end
		order_total(total_per_item)
	end

	def order_total(total_per_item)
		total_per_item.inject {|sum, value| sum + value}
	end

	def send_confirmation
    one_hour_from_now = (Time.now + 60*60).strftime("%H:%M")
	  order_confirmation = "Thank you! Your order was successfully placed and will be delivered before #{one_hour_from_now}"
    send_sms(order_confirmation)
	end

	def twilio_client
		account_sid = TwilioCredentials::TEST_ACCOUNT_SID
		auth_token = TwilioCredentials::TEST_AUTH_TOKEN
		twilio_client = Twilio::REST::Client.new(account_sid, auth_token)
	end

	def send_sms(order_confirmation)
		twilio_client.account.sms.messages.create({
			:from => TwilioCredentials::FROM_NUMBER,
			:to => TwilioCredentials::TO_NUMBER,
			:body => order_confirmation
			})
	end
end