class AddTermsAcceptedToShoppingCart < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_carts, :terms_accepted, :boolean, null: false, default: false
  end
end
