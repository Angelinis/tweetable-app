class ChangeRoleDefaultOnUser < ActiveRecord::Migration[7.0]
  def up
    change_column_default(:users, :role, 0)
  end
  
  def down
    change_column_default(:users, :role, nil)
  end
end
