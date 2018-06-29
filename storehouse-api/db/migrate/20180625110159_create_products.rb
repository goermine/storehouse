class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text    :name
      t.text    :image
      t.integer :score
      t.integer :price
      t.text    :url
      t.references :category
      t.timestamps
    end
  end
end
