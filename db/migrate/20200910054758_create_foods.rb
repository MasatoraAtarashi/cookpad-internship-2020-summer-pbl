class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :picture
      t.float :protein
      t.float :lipid
      t.float :carbohydrate
      t.float :vitamin

      t.timestamps
    end
  end
end
