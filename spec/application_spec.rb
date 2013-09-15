require'./lib/food'
require'./lib/menu'
require'./lib/takeaway'

describe 'application' do

let(:takeaway) {Takeaway.new(menu)}
let(:menu) {Menu.new([korma, madras, rice])}
let(:korma) {Food.new("Korma", 5)}
let(:madras) {Food.new("Madras", 5)}
let(:rice) {Food.new("Rice", 2)}

	it 'should place an order if the money is correct' do
		takeaway.place_order("korma 2 madras 2 rice 4", 28).should eq true
	end
end