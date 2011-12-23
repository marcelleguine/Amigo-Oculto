class FixParticipateStatusType < ActiveRecord::Migration
  def self.up
    change_column :participates, :status, :integer, :default => 0
  end

  def self.down
    change_column :participates, :status, :string
  end
end
