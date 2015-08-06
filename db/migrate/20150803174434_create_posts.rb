class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :brand_name
      t.string :retailer
      t.string :price
      t.string :size
      t.string :photo_url
      t.references :user, index: true, foreign_key: true
    end
  end
end
