class AddOwnerToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :owner, :integer
  end
end
