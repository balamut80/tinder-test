class LikesPhoto < ActiveRecord::Base
	VOTE_STATUS = {
			'dislike' => 0,
			'like' => 1
	}
end