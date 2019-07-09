class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.string :format
      t.string :leader_1
      t.string :leader_2
      t.integer :room
      t.string :content
      t.boolean :lock, default: false

      t.timestamps
    end
  end
end
