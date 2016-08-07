class Ad::AcademiesController < ApplicationController

	layout 'ad'

	before_action :find_academy, only: [:show, :edit, :update]
	before_action :find_user,  only: [:new, :create, :show]

	def new
		@academy = Academy.new
	end

	def create
		@academy = Academy.new(academy_params)
		if @academy.save
      flash[:notice] = "Academia cadastrada com sucesso"
      redirect_to  ad_root_path
    else
      render :new
    end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @academy.update(academy_params)
        format.html { redirect_to [:ad, @academy], notice: 'Academia atualizada com sucesso' }
      else
        format.html { render :edit }
      end
    end
	end

	def show
	end

	private

	def find_user
    @user = User.find(current_ad_user.id)
  end

	def find_academy
		# Usuário tem acesso apenas a sua academia
		# @academy = @user.academy.find(params[:id])
		@academy = User.find(current_ad_user.id).academy
	end

	def academy_params
		params.require(:academy).permit(:name, :description, :cnpj, :phone, :user_id)
	end

	def auth_layout
		current_ad_user.academy.present? ? 'ad' : 'auth'
  end

end
