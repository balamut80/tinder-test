class VotesController < ApplicationController
	before_action :authenticate_user!

	def index
		@votes = LikesPhoto.where(user_id: current_user.id)
	end
end
