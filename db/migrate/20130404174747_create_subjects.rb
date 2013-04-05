class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name

      t.timestamps
    end
    add_index :subjects, [:user_id]
  end
end
