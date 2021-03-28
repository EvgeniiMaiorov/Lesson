class AddTokenToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :token, :string
    add_index :authors, :token, unique: true
  end
end
