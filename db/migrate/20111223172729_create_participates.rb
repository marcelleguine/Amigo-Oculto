class CreateParticipates < ActiveRecord::Migration
  def self.up
    create_table :participates do |t|
      t.references :user
      t.references :group
      t.string :status
      t.integer :friend_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :participates
  end
end
