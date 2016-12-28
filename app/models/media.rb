class Media < ActiveRecord::Base
	mount_uploader :file_name, MediaUploader
	belongs_to :user

end