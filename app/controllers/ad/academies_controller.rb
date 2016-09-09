class Ad::AcademiesController < ApplicationController

	layout 'ad'

	before_action :find_academy, only: [:show, :edit, :update, :destroy]

	def new
		@academy = current_ad_user.build_academy
	end

	def create
		@academy = current_ad_user.build_academy(academy_params)
		if @academy.save
      flash[:notice] = "Academia cadastrada com sucesso"
      redirect_to  ad_root_path
    else
      render 'edit'
    end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @academy.update(academy_params)
        redirect_to [:ad, @academy], notice: 'Academia atualizada com sucesso' 
      else
        render 'edit'
      end
    end
	end

	def show
	end

	private

		def find_academy
			@academy = Academy.find(params[:id])
		end

		def academy_params
			params.require(:academy).permit(:name, :description, :cnpj, :phone, :user_id)
		end

		def auth_layout
			current_ad_user.academy.present? ? 'ad' : 'auth'
	  end

end
