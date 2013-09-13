require 'food'

describe Food do

let(:korma) {Food.new(Korma)}

	it 'should have a name' do
		food.name == Korma
	end

	it 'should contain a price for each food item' do
		food.items[korma].should eq 4.95
	end

end