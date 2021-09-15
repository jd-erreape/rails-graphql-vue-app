class AddRepliedIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :replied_id, :bigint
    add_foreign_key :posts, :posts, column: :replied_id
  end
end
