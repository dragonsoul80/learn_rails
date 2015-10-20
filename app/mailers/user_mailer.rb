class UserMailer < ActionMailer::Base #ApplicationMailer
	default from: "do-not-reply@example.com"

	
# to solve problem when cant receive email from app.
#http://stackoverflow.com/questions/18124878/netsmtpauthenticationerror-when-sending-email-from-rails-app-on-staging-envir

	def contact_email(contact)
		@contact = contact
		mail(to: ENV["OWNER_EMAIL"], from: @contact.email, :subject => "Website Contact")
	end
end
