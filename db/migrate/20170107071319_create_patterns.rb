class CreatePatterns < ActiveRecord::Migration[5.0]
  def change
    create_table :patterns do |t|
      t.string :pattern
      t.string :page
      t.string :side
      t.string :offset

      t.timestamps
    end
  end
end
