class UpdateUsersAddAvatar < ActiveRecord::Migration
  def up
  	add_column :users, :avatar, :integer
  end

  def down
  	
    remove_column :users, :avatar
  end
end
