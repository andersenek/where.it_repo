class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.string :comment
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
