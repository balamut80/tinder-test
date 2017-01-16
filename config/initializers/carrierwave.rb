CarrierWave.configure do |config|
	config.fog_credentials = {
			# Configuration for Amazon S3
			:provider              => 'AWS',
			:aws_access_key_id     => 'AKIAISFSIVQY6R452F5Q',
			:aws_secret_access_key => '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',
			:region                => 'eu-west-1'
	}



	config.storage = :fog

	config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
	config.fog_directory    = 'tinder-test-task'

end