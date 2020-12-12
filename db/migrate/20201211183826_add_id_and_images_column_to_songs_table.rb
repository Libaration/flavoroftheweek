class AddIdAndImagesColumnToSongsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :uri, :string
    add_column :songs, :image, :string
  end
end
