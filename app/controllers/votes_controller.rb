class VotesController < ApplicationController
	before_action :authenticate_user!

	def index
		@votes = LikesPhoto.all
	end
end
