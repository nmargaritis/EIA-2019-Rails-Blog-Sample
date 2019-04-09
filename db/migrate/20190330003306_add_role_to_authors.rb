class AddRoleToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :role, :integer
  end
end
