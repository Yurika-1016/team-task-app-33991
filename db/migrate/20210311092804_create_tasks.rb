class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :time_required_id, null: false, numericality: { other_than: 0 }
      t.date :implementation_date, null: false
      t.datetime :dead_line_date, null: false
      t.integer :operator_id, null: false, numericality: { other_than: 0 }
      t.references :user, null:false, foreign_keys: true
      t.timestamps
    end
  end
end
