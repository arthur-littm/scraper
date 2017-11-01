class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price_with_vat
      t.string :price_no_vat
      t.string :website
      t.string :url

      t.timestamps
    end
  end
end
