class Measurement < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :program

  # validation
  validates_presence_of :height
  validates_presence_of :weight
end
