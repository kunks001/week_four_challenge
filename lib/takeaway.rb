class Takeaway

	def initialize(menu)
		@menu = menu
		@order = nil
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
		order = ordered_food
		order = check_order(order)
		quantities = order_quantities(order)
		order = check_order_against_menu(order)
		order = order.flatten

		if order_price(order, quantities) == money
			true
		else
			raise ArgumentError, "That\'s the wrong amount! Please try again"
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

		order_matches_menu
	end

	def order_quantities(order)
		order_quantities = []

		order.each do |dish|
			order_quantities << dish[1]
		end

		order_quantities
	end

	def order_price(order, quantities)
		food_price = order.map {|dish| dish.price}

		a, b = [], []
		a << food_price
		a << quantities
		a = a.transpose

		a.each do |dish|
			b << dish[0]*dish[1]
		end

		c = b.inject {|sum, value| sum + value}
		c
	end

end