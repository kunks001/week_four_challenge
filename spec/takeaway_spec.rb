require 'takeaway'

describe Takeaway do

let(:takeaway) {Takeaway.new(menu)}
let(:menu) {double(:menu)}

	it 'should initialise with a menu instance variable' do
		takeaway.menu.should eq menu
	end

end