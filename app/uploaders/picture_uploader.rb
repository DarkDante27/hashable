class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick
  process resize_to_limit: [500, 500]
  process :quality => 100

  version :medium do
    process :quality => 100
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
