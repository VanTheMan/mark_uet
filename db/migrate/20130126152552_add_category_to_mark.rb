class AddCategoryToMark < ActiveRecord::Migration
  def change
    add_column :marks, :category, :string
  end
end
