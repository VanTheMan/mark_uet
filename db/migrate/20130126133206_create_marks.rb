class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :title
      t.string :link
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
