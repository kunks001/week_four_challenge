require 'menu'

describe Menu do

let(:menu) {Menu.new}

	it 'should initialise with a food items hash' do
		menu.food_items.class.should eq Hash
	end

end