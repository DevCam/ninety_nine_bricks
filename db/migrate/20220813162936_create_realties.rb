class CreateRealties < ActiveRecord::Migration[7.0]
  def change
    create_table :realties do |t|
      t.text :address
      t.text :img

      t.timestamps
    end
  end
end
