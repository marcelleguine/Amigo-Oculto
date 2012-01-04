class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.references :group
      t.references :user
      t.string :code
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
