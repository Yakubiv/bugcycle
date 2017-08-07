class AddUsageToBicycles < ActiveRecord::Migration[5.0]
  def change
    add_column :bicycles, :usage, :boolean, default: false
  end
end
