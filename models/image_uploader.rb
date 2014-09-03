# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  storage :qiniu

  self.qiniu_bucket = "andy-images"
  self.qiniu_bucket_domain = "andy-images.qiniudn.com"

  def filename
    var = :"@#{mounted_as}_filename"
    model.instance_variable_set(var, "#{secure_token(file)}.#{file.extension.downcase}") if original_filename
  end

  protected
  def secure_token(file)
    Digest::SHA1.hexdigest("#{file.read}")
  end

end
