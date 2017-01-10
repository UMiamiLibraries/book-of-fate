class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.references :page, foreign_key: true
      t.string :title
      t.string :author
      t.string :link

      t.timestamps
    end
  end
end
