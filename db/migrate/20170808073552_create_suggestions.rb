class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :category_id, index: true
      t.references :user, index: true
      t.references :bicycle, index: true
      t.boolean :approved
      t.date :approved_at

      t.timestamps
    end
  end
end
