class LikesPhoto < ActiveRecord::Base
	belongs_to :media
	belongs_to :media_user, :foreign_key => "media_user_id",
					 :class_name => "User"

	after_create :create_chat

	VOTE_STATUS = {
			'dislike' => 0,
			'like' => 1
	}

	private

	def create_chat
		user_likes_me = LikesPhoto.where(like: VOTE_STATUS['like']).where(user_id: media_user_id).where(media_user_id: user_id).first
    chat_exist = Chat.between(user_id, media_user_id).first

		if user_likes_me && !chat_exist
			Chat.create(
					sender_id: user_id,
					recipient_id:	media_user_id,
			)
		end
	end
end