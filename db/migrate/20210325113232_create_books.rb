class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true, null: false
      t.string :title
      t.timestamps
    end
  end
end
