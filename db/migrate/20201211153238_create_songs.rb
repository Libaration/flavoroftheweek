class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
