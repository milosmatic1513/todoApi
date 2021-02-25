require 'rails_helper'

RSpec.describe User, type: :model do

  #Bug fix for rspec "name" variable
  let(:name) {"User name"}
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:todos).dependent(:destroy) }
  # Validation test
  #ensure column name is present before saving
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password)}
end
