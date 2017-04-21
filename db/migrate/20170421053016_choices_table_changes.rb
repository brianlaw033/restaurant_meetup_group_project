class ChoicesTableChanges < ActiveRecord::Migration
  def change
    add_column(:choices, :user2_choices, :integer, array:true)
    drop_table(:logistics)
  end
end
