# rails g migration AddPasswordToAuthor password_digest
class AddPasswordToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :password_digest, :string
  end
end
