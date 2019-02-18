class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :title
      t.text :description
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
