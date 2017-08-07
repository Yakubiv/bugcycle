class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.string :image
      t.text :description
      t.references :user, index: true
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
