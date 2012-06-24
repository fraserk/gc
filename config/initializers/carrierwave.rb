# CarrierWave.configure do |config|
#   config.root = Rails.root.join('tmp')
#   config.cache_dir = 'carrierwave'
#   :provider               => 'AWS',
#   config.s3_access_key_id = ENV['AKIAJWBVG3W2FCF5HDTA']
#   config.s3_secret_access_key = ENV['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']
#   config.s3_bucket = ENV['GC-Data']
# end

CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/"
   config.storage = :fog
  # config.permissions = 0666
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJWBVG3W2FCF5HDTA',       # required
    :aws_secret_access_key  => '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',       # required
  # :region                 => 'us-east-1'  # optional, defaults to 'us-east-1' 
  }
  config.fog_directory  = 'GC-Data'                     # required
  
  
end