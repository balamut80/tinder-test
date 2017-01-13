class ChatsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user_chats = Chat.all
	end

	def show
		@messages = Message.all
	end
end