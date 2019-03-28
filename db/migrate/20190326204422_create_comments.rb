class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.references :job_posting, foreign_key: true

      t.timestamps
    end
  end
end
