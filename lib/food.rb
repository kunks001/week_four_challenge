class Food

	def initialize(name, price = 5)
		@name = name.capitalize
		@price = price
	end

	def name
		@name
	end

	def price
		@price
	end

end