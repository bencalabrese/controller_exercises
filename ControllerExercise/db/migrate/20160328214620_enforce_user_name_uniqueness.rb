class EnforceUserNameUniqueness < ActiveRecord::Migration
  def change
    add_index(:users, :username)
    change_column(:users, :username, :string, unique: true)
  end
end
