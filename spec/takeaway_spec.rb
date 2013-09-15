require 'takeaway'

describe Takeaway do

let(:takeaway) {Takeaway.new(menu)}
let(:menu) {double(:menu)}
let(:food) {double(:food, {name: "Korma", price: 5})}
let(:food2) {double(:food, {name: "madras", price: 5})}

	it 'should initialise with a menu instance variable' do
		takeaway.menu.should eq menu
	end

	it 'should organise the order by name and quantity' do
		takeaway.check_order("korma 2 madras 3").should == [["Korma", 2], ["Madras", 3]]
	end

	it 'should know the quantities of each food' do
		takeaway.order_quantities([["korma", 2], ["madras", 3]]).should eq [2, 3]
	end

	it 'should check the order against the menu' do
		menu.stub_chain(:food_items, :select).and_return(food)
		takeaway.check_order_against_menu([["Korma", 2]]).should eq [food]
	end

	it 'should sum up the order price' do
		takeaway.order_price([food, food2], [1,1]).should eq 10
	end
end