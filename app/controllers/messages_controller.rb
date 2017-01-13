class MessagesController < ApplicationController
	before_action :authenticate_user!

	def create
		@message = current_user.messages.create(messages_params)
	end

	def messages_params
		params.require(:message).permit(:body, :chat_id)
	end
end