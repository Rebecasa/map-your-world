class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.boolean :visited, default: false
      t.boolean :planned, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
