class Ad::AcademiesController < ApplicationController

	layout :auth_layout

	before_filter :find_academy, only: [:edit]
	before_filter :find_user,  only: [:index, :new, :create]

	def index
		@academies = @user.academies.all
	end

	def new
		@academy = @user.academies.new
	end

	def create
		@academy = @user.academies.new(academy_params)
		if @academy.save
      flash[:notice] = "Academia cadastrada com sucesso"
      redirect_to  ad_root_path
    else
      render :new
    end
	end

	def edit
	end

	private

	def find_user
    @user = User.find(current_ad_user.id)
  end

	def find_academy
		@academy = Academy.find(params[:id])
	end

	def academy_params
		params.require(:academy).permit(:name, :description, :cnpj, :phone, :user_id)
	end

	def auth_layout
		current_ad_user.academies.present? ? 'ad' : 'auth'
  end

end
