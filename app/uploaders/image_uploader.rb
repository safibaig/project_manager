# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "/assets/user-generic_admin.png"
  end
  
  version :thumb do
    process :resize_to_fill => [56, 65]
  end
  
  version :profile do
    process :resize_to_fill => [210, 210]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end

