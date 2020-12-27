require 'rails_helper'

RSpec.describe Program, type: :model do
  it { should have_many(:measurements).dependent(:destroy) }
end
