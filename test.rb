require './lib/food'
require './lib/menu'
require './lib/takeaway'

food1 = Food.new("korma", 5)
food2 = Food.new("madras", 5)
food3 = Food.new("rice", 2)

menu = Menu.new([food1, food2, food3])

takeaway = Takeaway.new(menu)

# menu.view

takeaway.order_price([food1, food2], [2,1])