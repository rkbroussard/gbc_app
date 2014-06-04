CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJMAEUMTDPV46WFYQ',       # required
    :aws_secret_access_key  => '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',       # required
    #:region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'gbc_docs' # required
  #config.fog_host       = 'https://#{gbc_docs}.s3.amazonaws.com'            # optional, defaults to nil
  #config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end