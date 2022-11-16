class AddIsOldPlacedToPostamats < ActiveRecord::Migration[7.0]
  def up
    add_column :automatic_post_offices, :is_placed_old, :boolean
  end

  def down
    remove_column :automatic_post_offices, :is_placed_old
  end
end
