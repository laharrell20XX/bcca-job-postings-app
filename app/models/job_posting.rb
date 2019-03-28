class JobPosting < ApplicationRecord
  belongs_to :employer
  has_many :comments
end
