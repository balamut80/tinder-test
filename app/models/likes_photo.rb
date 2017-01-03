class LikesPhoto < ActiveRecord::Base
	belongs_to :media
	belongs_to :media_user, :foreign_key => "media_user_id",
					 :class_name => "User"

	VOTE_STATUS = {
			'dislike' => 0,
			'like' => 1
	}
end