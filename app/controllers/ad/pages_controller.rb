class Ad::PagesController < ApplicationController

	layout 'ad'

	def index
		@academy = Academy.where(user_id: current_ad_user)
	end

end