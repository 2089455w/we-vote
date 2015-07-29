class AddFieldsToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :user_id, :integer
    add_column :subscriptions, :sub_id, :integer
    
    
   
    
    
  end
end
