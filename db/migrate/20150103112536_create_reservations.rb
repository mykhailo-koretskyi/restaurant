class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :table, index: true
      t.references :user, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
    add_foreign_key :reservations, :tables
    add_foreign_key :reservations, :users
  end
end
