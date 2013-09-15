require 'food'

describe Food do

let(:food) {Food.new("korma", 4.95)}

	it 'should have a capitalized name' do
		food.name.should eq "Korma"
	end

	it 'should have a price' do
		food.price.should eq 4.95
	end
end