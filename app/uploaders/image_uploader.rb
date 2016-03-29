# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  attr_writer :sanitize_regexp
  def sanitize_regexp
    @sanitize_regexp ||=  /[^\w\.\-]/
  end

  # storage :fog
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "avatar_#{Rails.env}/#{model.class.to_s.downcase.pluralize}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [ENV['RESIZED_PHOTO_WIDTH'], ENV['RESIZED_PHOTO_HIGHT']]  
  end
  
  version :small do
    process :resize_to_limit => [ENV['RESIZED_PHOTO_WIDTH_SMALL'], ENV['RESIZED_PHOTO_HIGHT_SMALL']]  
  end
  
  def get_version_dimensions
     width, height = `identify -format "%wx%h" #{file.path}`.split(/x/)
   end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  #   Add a white list of extensions which are allowed to be uploaded.
  #   For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png bmp)
  end



  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    sanitize(original_filename) if original_filename
  end

  def sanitize(name)
    name = name.gsub("\\", "/") # work-around for IE
    name = File.basename(name)
    name = name.gsub(sanitize_regexp,"_")
    name = "_#{name}" if name =~ /\A\.+\z/
    name = "unnamed" if name.size == 0
    return name.mb_chars.to_s
  end

end