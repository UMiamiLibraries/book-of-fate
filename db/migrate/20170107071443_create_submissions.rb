class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.references :transcription, foreign_key: true
      t.string :submission

      t.timestamps
    end
  end
end
