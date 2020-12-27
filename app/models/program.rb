class Program < ApplicationRecord
  # model association
  belongs_to :user, optional: true
  has_many :measurements, dependent: :destroy
end
