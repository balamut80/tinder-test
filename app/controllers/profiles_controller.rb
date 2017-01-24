class ProfilesController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :js

	def index
		@photo = get_photo
	end

	def vote
		ViewedPhoto.create(user_id: current_user.id, media_id: params[:media_id], showed_at: DateTime.now)

		begin
			media = Media.find(params[:media_id])
			LikesPhoto.create(
					user_id: current_user.id,
					media_id:	params[:media_id],
					media_user_id: media.user.id,
					like: LikesPhoto::VOTE_STATUS[params[:commit]]
			)

			@chat_id = 0
			chat = Chat.between(current_user.id, media.user.id).first
			if chat && params[:commit] == 'like'
				@chat_id = chat.id
				render status: 302
			else
				@photo_next = get_photo
				render status: 200
			end
		rescue
			render status: 400
		end
	end

	private

	def get_photo
		viewed_photos = ViewedPhoto.where(user_id: current_user.id).where("showed_at >= ?", 6.hours.ago).pluck(:media_id)
		photo = Media.where.not(user_id: current_user.id)
		photo = photo.where('id NOT IN (?)', viewed_photos) unless viewed_photos.blank?
		photo.order("RANDOM()").first
	end

end
