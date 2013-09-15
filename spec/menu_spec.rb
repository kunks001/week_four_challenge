require 'menu'

describe Menu do

let(:food) {double(:food, {name: "Korma", price: 4.95})}
let(:menu) {Menu.new([food])}

	it 'should initialise with a food items array' do
		menu.food_items.class.should eq Array
	end

	it 'should have food options' do
		menu.food_items[0].name.should eq "Korma"
	end

	it 'should contain food prices' do
		menu.food_items[0].price.should eq 4.95
	end

	# it 'should allow you to view the menu' do
	# 	food.stub(:name).and_return("Korma")
	# 	food.stub(:price).and_return(4.95)

	# 	menu.view.should eq  "Korma, 4.95\n"
	# end

	### 'EACH' METHOD RETURNING OBJECT INSTEAD OF USING STUBBED METHODS?? 
end