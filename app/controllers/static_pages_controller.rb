class StaticPagesController < ApplicationController

def home
	@visitor = Visitor.new
	@contact = Contact.new
	end

end
