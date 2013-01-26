class AddCodeToMark < ActiveRecord::Migration
  def change
    add_column :marks, :code, :string
  end
end
