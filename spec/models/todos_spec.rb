require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo, type: :model do
  #Bug fix for rspec "name" variable
  let(:name) { "Todo model name" }

  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # ensure a todo record belongs to a single user record
  it { should belong_to(:user)}
  # Validation tests# ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:created_by)}

end
