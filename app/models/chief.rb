class Chief < ApplicationRecord
  belongs_to :team

  validates_uniqueness_of :chief_name
  validates_presence_of :chief_name
end
