class CreateTranscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :transcriptions do |t|
      t.references :question, foreign_key: true
      t.references :pattern, foreign_key: true
      t.string :transcription
      t.boolean :locked

      t.timestamps
    end
  end
end
