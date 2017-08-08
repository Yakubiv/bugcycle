class CreateUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :usages do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bicycle, index: true

      t.timestamps
    end
  end
end
