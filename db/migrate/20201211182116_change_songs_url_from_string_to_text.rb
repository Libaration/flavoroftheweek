class ChangeSongsUrlFromStringToText < ActiveRecord::Migration[6.0]
  def change
    change_column :songs, :url, :text
  end
end
