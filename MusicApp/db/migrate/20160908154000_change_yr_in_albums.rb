class ChangeYrInAlbums < ActiveRecord::Migration
  def change
    change_column_null :albums, :yr, false
  end
end
