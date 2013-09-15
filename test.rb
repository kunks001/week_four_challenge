# require './lib/food'
# require './lib/menu'
# require './lib/takeaway'

# food1 = Food.new("korma", 5)
# food2 = Food.new("madras", 5)
# food3 = Food.new("rice", 2)

# menu = Menu.new([food1, food2, food3])

# takeaway = Takeaway.new(menu)

# takeaway.place_order('korma 1', 5)

require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account 
account_sid = 'AC61e0136ceb124baf3dbcecb1d9241bcc'
auth_token = 'b8a457aa62a82b2f32dbebed46299586'
@client = Twilio::REST::Client.new(account_sid, auth_token)
 
message = @client.account.sms.messages.create(:body => "hullooo",
    :to => "+447957163806",
    :from => "+441827231022")
puts message.from
