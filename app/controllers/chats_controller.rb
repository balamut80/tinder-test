class ChatsController < ApplicationController
	before_action :authenticate_user!
	before_action :chat_allowed, only: [:show]

	def index
		@user_chats = Chat.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
	end

	def show
		@messages = Message.where(chat_id: params[:id])
	end

	private

	def chat_allowed
		redirect_to root_path unless Chat.where(id: params[:id]).where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
	end
end