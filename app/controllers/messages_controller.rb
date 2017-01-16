class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :chat_allowed, only: [:create]

	def create
		@message = current_user.messages.create(messages_params)
	end

	def messages_params
		params.require(:message).permit(:body, :chat_id)
	end

	private

	def chat_allowed
		unless Chat.involving(current_user).where(id: params[:chat_id])
		  render text: 'You do not have permission to modify this chat', status: 403
		end
	end
end