class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :quantity, null: false
      t.belongs_to :pizza
      t.timestamps
    end
  end
end
