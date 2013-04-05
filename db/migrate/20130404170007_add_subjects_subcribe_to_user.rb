class AddSubjectsSubcribeToUser < ActiveRecord::Migration
  def change
    add_column :users, :subjects_subcribe, :string
  end
end
