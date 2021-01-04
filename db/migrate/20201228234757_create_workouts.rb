class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :body_part
      t.integer :time
      t.text :desc
      t.integer :user_id
    end
  end
end
