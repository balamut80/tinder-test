CarrierWave.configure do |config|
	config.fog_credentials = {
			# Configuration for Amazon S3
			:provider              => 'AWS',
			:aws_access_key_id     => 'AKIAISFSIVQY6R452F5Q',
			:aws_secret_access_key => '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',
			:region                => 'eu-west-1'
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
	config.fog_directory    = 'tinder-test-task'

end