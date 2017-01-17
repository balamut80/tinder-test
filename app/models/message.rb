class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

	validates_presence_of :body, :chat_id, :user_id

	scope :unreaded, -> (user) do
		where("messages.user_id != ? AND messages.viewed = ?", user.id, false)
	end
end
