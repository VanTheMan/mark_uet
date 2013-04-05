class CreateSubjectsUsersTable < ActiveRecord::Migration
  def up
    create_table :subjects_users, :id => false do |t|
        t.references :subject
        t.references :user
    end
    add_index :subjects_users, [:subject_id, :user_id]
    add_index :subjects_users, [:user_id, :subject_id]
  end

  def down
    drop_table :subjects_users
  end
end
