require './lib/inject'

describe Array do

	it 'should return a sum of elements if inject is used' do
		[1, 2, 3, 4].inject{ |sum, value| sum + value }.should eq 10
	end

	it 'should return a sum of elements if inject is used' do
		["1", "2", "3", "4"].inject{ |sum, value| sum + value }.should eq "1234"
	end
end