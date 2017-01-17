class ChatsController < ApplicationController
	before_action :authenticate_user!
	before_action :chat_allowed, only: [:show]
	after_action  :mark_readed, only: [:show]

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

	def mark_readed
	  @messages.unreaded(current_user).update_all(viewed: true)
	end

end