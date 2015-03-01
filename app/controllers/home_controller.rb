class HomeController < ApplicationController

	def index
		# @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
		@users = User.all_except(current_user)
		@channels = Channel.all
	end
end
