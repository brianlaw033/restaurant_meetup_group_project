class AlterTableAgain < ActiveRecord::Migration
  def change
    remove_column(:messages, :sent_by)
    add_column(:messages, :sent_by_id, :integer)
  end
end
