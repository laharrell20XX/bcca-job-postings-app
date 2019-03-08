class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :company_desc
      t.string :employee_count
      t.string :logo_url
      t.string :industry
      t.string :founded_date
      t.string :headquarters_address

      t.timestamps
    end
  end
end
