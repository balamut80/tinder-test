# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base
	#include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	#version :avatar, if: :create_avatar? do
	#	process :resize_to_limit => [200, 200]
	#end
end
