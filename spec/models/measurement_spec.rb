require 'rails_helper'

RSpec.describe Measurement, type: :model do
  # Association test
  # ensure an item record belongs to a single program record
  it { should belong_to(:program) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }
end
