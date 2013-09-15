require 'takeaway'

describe Takeaway do

let(:takeaway) {Takeaway.new(menu)}
let(:menu) {double(:menu)}
let(:food) {double(:food, {name: "Korma", price: 5})}
let(:food2) {double(:food, {name: "madras", price: 5})}

	context 'should have a' do

		it 'menu instance variable' do
			takeaway.menu.should eq menu
		end
	end

	context 'should be able to' do

		it 'organise the order by name and quantity' do
			takeaway.check_order("korma 2 madras 3").should == [["Korma", 2], ["Madras", 3]]
		end

		it 'determine the quantities of each food' do
			takeaway.check_order_quantities([["korma", 2], ["madras", 3]]).should eq [2, 3]
		end

		it 'check the order against the menu' do
			menu.stub_chain(:food_items, :select).and_return(food)
			takeaway.check_order_against_menu([["Korma", 2]]).should eq [food]
		end

		it 'sum up the order price' do
			takeaway.order_price([food, food2], [1,1]).should eq 10
		end
	end

	context 'should be able to send sms messages' do
		let(:twilio_client) { double :TwilioRESTClient }

		it 'via a Twilio client' do
			expect(Twilio::REST::Client).to receive(:new).and_return twilio_client
			takeaway.twilio_client.should eq twilio_client
		end

		it 'with content' do
			content = 'You have successfully placed your order'
			takeaway.send_sms(content) do |message_hash|
				expect(message_hash[:body]).to eq(content)
			end
    end
	end

	context 'should receive' do
  	context 'incorrect orders and' do
      it 'raise an error if the total is wrong' do
      	menu.stub_chain(:food_items, :select).and_return(food)
        expect(takeaway.place_order('Korma 1', 10)).to raise_error(ArgumentError, "That is the wrong amount! Please try again")
      end
    end

    context 'correct orders and' do

      it 'place them' do
        expect(takeaway).to receive(:send_sms).and_return true
        menu.stub_chain(:food_items, :select).and_return(food)
        expect(takeaway.place_order('korma, 1', 5)).to be_true
      end

      it 'confirm the delivery time of one hour from now' do
        	takeaway.send_confirmation do |message|
          	expect(message).to include "Thank you!"
        end
      end	
	  end
	end
end