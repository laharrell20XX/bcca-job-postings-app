class CreateJobPostings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_postings do |t|
      t.string :position_name
      t.string :position_desc
      t.string :location
      t.string :benefits
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
