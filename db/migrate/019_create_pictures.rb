class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :image
      t.string :md5
      t.timestamps
    end
  end
end