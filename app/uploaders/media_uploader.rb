# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

	storage :aws

	def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
	end

	def extension_white_list
		%w(jpg jpeg png)
	end

	version :preview do
		process resize_to_limit: [nil, 160]
	end


end
