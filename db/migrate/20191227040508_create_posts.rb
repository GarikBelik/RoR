class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :post do |t|
      t.string :title
      t.string :summary
      t.text :body

      t.timestamps
    end
  end
end
