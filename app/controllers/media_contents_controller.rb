class MediaContentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@media_contents = current_user.medias.all
	end

	def create
		@media = Media.new(file_name: params[:file], user_id: current_user.id)
		if @media.save!
			render json: @media
		else
			render json: { error: 'Failed to process' }, status: 422
		end
	end

	def delete_media
		Media.where(id: params[:media_contents]).destroy_all
		redirect_to root_url
	end

	def delete_all
		current_user.medias.delete_all
		redirect_to root_url
	end
end
