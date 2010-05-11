class BidulesController < ApplicationController
	def index
		@g = Group.first
	end
end
