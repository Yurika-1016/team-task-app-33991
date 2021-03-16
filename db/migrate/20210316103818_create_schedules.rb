class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :date, null: false, uniqueness: { scope: :user }
      t.integer :time_limit_id, null:false
      t.references :user, null:false, foreign_keys: true
      t.timestamps
    end
  end
end
