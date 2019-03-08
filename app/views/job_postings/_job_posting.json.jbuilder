json.extract! job_posting, :id, :position_name, :position_desc, :location, :benefits, :employer_id, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)
