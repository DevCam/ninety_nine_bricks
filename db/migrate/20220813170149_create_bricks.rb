class CreateBricks < ActiveRecord::Migration[7.0]
  def change
    create_table :bricks do |t|
      t.references :realty, null: false, foreign_key: true
      t.boolean :on_sale, null: false, default: false
      t.decimal :price

      t.timestamps
    end
  end
end
