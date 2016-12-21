CarrierWave.configure do |config|
	config.fog_credentials = {
			# Configuration for Amazon S3
			:provider              => 'AWS',
			:aws_access_key_id     => '',
			:aws_secret_access_key => '',
			:region                => ''
	}

	# For testing, upload files to local `tmp` folder.
	if Rails.env.development? || Rails.env.test?
		CarrierWave.configure do |config|
			config.storage = :file
		end
	end

	# Use AWS storage if in production
	if Rails.env.production?
		CarrierWave.configure do |config|
			config.storage = :fog
		end
	end

	config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

	config.fog_directory    = ''
	config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
	config.fog_host         = ''
end