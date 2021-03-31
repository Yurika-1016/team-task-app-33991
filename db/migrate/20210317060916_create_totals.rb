class CreateTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.datetime :start_time, null:false, uniqueness: { scope: :user }
      t.integer :working_hour, null:false, numericality: { only_integer: true }
      t.references :user, null:false, foreign_keys: true
    end
  end
end
