class Fixusers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :comments_count, :integer
    add_column :users, :likes_count, :integer
    add_column :users, :private, :boolean
  end
end
