class AddDateToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :date, :datetime
  end
end
