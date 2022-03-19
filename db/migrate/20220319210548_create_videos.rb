class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :category
      t.string :image_64
      t.string :image_128
      t.string :image_256

      t.timestamps
    end
  end
end
