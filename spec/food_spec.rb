require 'food'

describe Food do

let(:food) {Food.new("Korma", 4.95)}

	it 'should have a name' do
		food.name.should eq "Korma"
	end

	it 'should have a price' do
		food.price.should eq 4.95
	end

end