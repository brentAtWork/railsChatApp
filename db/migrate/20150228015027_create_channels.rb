class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :creator_id
      t.string 	:name

      t.timestamps null: false
    end

    add_index :channels, :creator_id
  end
end
