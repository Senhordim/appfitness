class Ad::PagesController < ApplicationController

	layout 'ad'

	def index
		@academy = current_ad_user.academy
	end

end