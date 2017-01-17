class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :chat_allowed, only: [:create]
	#skip_before_filter :verify_authenticity_token
	def create
		@message = current_user.messages.create(messages_params)
	end

	def mark_readed
		begin
			message = Message.where(id: params[:id]).where.not(user_id: current_user.id).first
			message.update_attribute(:viewed, true) if Chat.involving(current_user).where(id: message.chat_id) if message
		end
		render :nothing => true, :status => 200
	end

	private

	def messages_params
		params.require(:message).permit(:body, :chat_id)
	end

	def chat_allowed
		unless Chat.involving(current_user).where(id: params[:chat_id])
		  render text: 'You do not have permission to modify this chat', status: 403
		end
	end
end