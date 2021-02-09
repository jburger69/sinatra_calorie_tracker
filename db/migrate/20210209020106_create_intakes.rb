class CreateIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :intakes do |t|
      t.string :name
      t.integer :amount
      t.integer :user_id
      t.integer :days_id
    end
  end
end
