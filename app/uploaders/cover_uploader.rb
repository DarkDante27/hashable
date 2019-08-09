class CoverUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process resize_to_limit: [1000, 500]
  process :quality => 100

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
