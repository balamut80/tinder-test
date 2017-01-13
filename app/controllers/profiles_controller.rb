class ProfilesController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :js

	def index
		#@photo = get_photo
		#ViewedPhoto.create(user_id: current_user.id, media_id: @photo.id, showed_at: DateTime.now) if @photo
		@photo = Media.order("RANDOM()").first
	end

	def vote
		begin
			media = Media.find(params[:media_id])
			LikesPhoto.create(
					user_id: current_user.id,
					media_id:	params[:media_id],
					media_user_id: media.user.id,
					like: LikesPhoto::VOTE_STATUS[params[:commit]]
			)

			Chat.create(
					sender_id: current_user.id,
					recipient_id:	media.user.id,
			)

			@photo = get_photo
			render status: 200
		rescue
			render status: 400
		end
	end

	private

	def get_photo
		#viewed_photos = ViewedPhoto.where(user_id: current_user.id).where("showed_at <= ?", 6.hours.ago).pluck(:media_id)
		#Media.where.not(user_id: current_user.id).where('id NOT IN (?)', viewed_photos).order("RANDOM()").first
		Media.order("RANDOM()").first
	end


end
