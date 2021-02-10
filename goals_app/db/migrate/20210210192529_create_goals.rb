class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :details, null: false
      t.boolean :status, default: false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
