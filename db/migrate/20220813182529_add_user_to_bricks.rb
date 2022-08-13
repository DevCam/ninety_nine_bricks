class AddUserToBricks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bricks, :user, null: true, foreign_key: true
  end
end
