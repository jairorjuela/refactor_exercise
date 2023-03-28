class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :description
      t.integer :price, null: false, default: 0
      t.belongs_to :author, null: false, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
