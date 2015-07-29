class AddSubToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sub_id, :integer
    add_index :posts, :sub_id
  end
end
