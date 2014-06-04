CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJMAEUMTDPV46WFYQ',       # required
    :aws_secret_access_key  => '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',       # required
    #:region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'gbc_docs' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end