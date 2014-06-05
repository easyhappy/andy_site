class TimeAxis < ActiveRecord::Base
  def self.axes
    axes_array = TimeAxis.order('position desc')
    axes_hash = {}
    year = nil
    axes_array.each do |axis|
      unless axis.year == year
        axes_hash[axis.year] = []
        year = axis.year
      end
      axes_hash[year] << axis
    end
    axes_hash
  end
end