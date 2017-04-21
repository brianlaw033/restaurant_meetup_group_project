class ChoicesTable < ActiveRecord::Migration
  def change
    create_table(:choices) do |t|
      t.column(:match_id, :integer)
      t.column(:user1_choices, :integer, array:true)
      t.timestamps()
    end
  end
end
