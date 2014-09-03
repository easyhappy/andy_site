$: << File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
require 'image_uploader'

class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end