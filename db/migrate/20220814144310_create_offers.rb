class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.belongs_to :shopping_cart
      t.belongs_to :brick
      t.timestamps
    end
  end
end
