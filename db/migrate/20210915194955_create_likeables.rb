class CreateLikeables < ActiveRecord::Migration[6.1]
  def change
    create_table :likeables do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
