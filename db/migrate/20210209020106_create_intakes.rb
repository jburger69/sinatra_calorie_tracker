class CreateIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :intakes do |t|
      t.string :name
      t.integer :amount
      t.date :date
      t.integer :user_id
    end
  end
end
