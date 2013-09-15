require'./lib/food'
require'./lib/menu'
require'./lib/takeaway'

describe 'application' do

let(:takeaway) {Takeaway.new(menu)}
let(:menu) {Menu.new([korma, madras, rice])}
let(:korma) {Food.new("Korma", 5)}
let(:madras) {Food.new("Madras", 5)}
let(:rice) {Food.new("Rice", 2)}

	it 'should confirm an order if the money is correct' do
		plus_one_hour = (Time.now + 60*60).strftime("%H:%M")
		takeaway.place_order("korma 2 madras 2 rice 4", 28) do |message|
          	expect(message).to include "Thank you!" && plus_one_hour
          end
	end
end