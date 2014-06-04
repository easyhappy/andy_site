class CreateTimeAxes < ActiveRecord::Migration
  def self.up
    create_table  :time_axes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string    :year
      t.string    :date
      t.string    :title
      t.integer   :position
      t.text      :items
      t.boolean   :color
      t.boolean   :showable
    end
  end

  def self.down
    drop_table :time_axes
  end
end