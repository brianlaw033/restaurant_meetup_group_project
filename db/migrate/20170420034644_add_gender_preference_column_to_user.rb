class AddGenderPreferenceColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :gender_preference, :string)
  end
end
