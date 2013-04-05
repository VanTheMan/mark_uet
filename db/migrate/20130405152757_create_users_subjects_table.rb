class CreateUsersSubjectsTable < ActiveRecord::Migration
  def up
    create_table :users_subjects, :id => false do |t|
        t.references :user
        t.references :subject
    end
    add_index :users_subjects, [:user_id, :subject_id]
    add_index :users_subjects, [:subject_id, :user_id]
  end

  def down
    drop_table :users_subjects
  end
end
