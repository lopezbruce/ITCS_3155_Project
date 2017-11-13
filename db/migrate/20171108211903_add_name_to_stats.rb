class AddNameToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :name, :string
  end
end
