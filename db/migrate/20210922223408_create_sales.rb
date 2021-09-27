class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.string :origin
      t.string :blend_name

      t.timestamps
    end
  end
end
