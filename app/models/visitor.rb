class Visitor < ActiveRecord::Base
	has_no_table
	
# in Ruby 4.2.2 need to replace column to attr_accessor
	attr_accessor :email, :string
	
	# See another format in app/models/user.rb
	validates_presence_of :email
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

def subscribe
		
		@list_id = ENV['MAILCHIMP_LIST_ID']
		mailchimp = Gibbon::Request.new
		mailchimp.timeout = 15
		result = mailchimp.lists(@list_id).members.create(body: {
		email_address: self.email, 
		status: "subscribed", 
		})
		Rails.logger.info("Subscribed #{self.email} to MailChimp") if result

end


#	def subscribe
#		mailchimp = Gibbon::Request.new 
#		result = mailchimp.lists.subscribe({
#		:id => ENV['MAILCHIMP_LIST_ID'],
#		:email => {:email => self.email},
#		:double_optin => false,
#		:update_existing => true,
#		:send_welcome => true
#		})
#		Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
#	end
end