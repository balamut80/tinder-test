class ChatsController < ApplicationController
	before_action :authenticate_user!
	before_action :chat_allowed, only: [:show]

	def index
		@user_chats = Chat.involving(current_user)
	end

	def show
		@chat_id = params[:id]
		@messages = Message.where(chat_id: @chat_id)
	end

	private

	def chat_allowed
		redirect_to root_path unless Chat.involving(current_user).where(id: params[:id])
	end
end