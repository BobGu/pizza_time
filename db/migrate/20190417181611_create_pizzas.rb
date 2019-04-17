class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name, null: false
      t.decimal :price, null: false

      t.timestamps 
    end
  end
end
