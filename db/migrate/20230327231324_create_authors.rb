class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
