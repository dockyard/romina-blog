class AddDestroyedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :destroyed_at, :datetime
  end
end
