require 'food'

describe Food do

let(:korma) {food.new(Korma)}

	it 'should have a name' do
		food.name == Korma
	end

end