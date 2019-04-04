class JobPosting < ApplicationRecord
  belongs_to :employer
  has_many :comments

  # orders job_postings alphabetically by position_name
  def self.alphabetically
    JobPosting.order(:position_name)
  end

  # orders job_postings reverse alphabetically by position_name
  def self.reverse_alphabetically
    JobPosting.order(position_name: :desc)
  end

  # orders job_postings with oldest created first, newest created last
  def self.oldest_newest_created
    JobPosting.order(:created_at)
  end

  # orders job_postings with newest created first, oldest created last
  def self.newest_oldest_created
    JobPosting.order(created_at: :desc)
  end

end
