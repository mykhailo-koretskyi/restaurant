class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
