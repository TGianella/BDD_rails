class CreateDogsStrollsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dogs, :strolls
  end
end
