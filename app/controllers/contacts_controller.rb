class ContactsController < ApplicationController

def new
	@contact = Contact.new
end

def create
	@contact = Contact.new(contact_params)
	if @contact.valid?
		@contact.update_spreadsheet
		UserMailer.contact_email(@contact).deliver
		redirect_to({ action: 'new' }, notice: "Thanks #{params[:contact][:name]} for your message.")
	else
		render :new
	end
end

	private

	def contact_params
	params.require(:contact).permit(:name, :email, :content)
	end
end
