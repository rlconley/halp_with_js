require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "a user" do
    subject { users(:one) }

    should have_many(:problems)
    should have_many(:notes)

    should have_secure_password

    should validate_presence_of(:name)
    should validate_presence_of(:email)

    should validate_uniqueness_of(:email).case_insensitive

    should_not allow_value("BAD EMAIL").for(:email)
    should_not allow_value("@").for(:email)
    should_not allow_value("  clinton@example.org").for(:email)
  end
end
