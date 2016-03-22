class StaticPagesController < ApplicationController

def home
	@visitor = Visitor.new
	end

end
