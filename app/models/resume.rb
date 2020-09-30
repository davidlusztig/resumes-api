class Resume < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :function, presence: true
  validates :job_description, presence: true
end
