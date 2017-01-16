module ApplicationHelper

	def chat_opponent(chat)
		if chat.recipient == current_user
		  link_to chat.sender.email, chat_path(chat)
		else
			link_to chat.recipient.email, chat_path(chat)
		end
	end
end
