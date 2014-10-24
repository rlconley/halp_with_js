require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  context "a user" do
    subject { problems(:one) }

    should have_many(:notes)
    should belong_to(:user)

    should validate_presence_of(:description)
    should validate_presence_of(:tried)
    should "not be resolved on creation" do
      setup do
        @user = User.new
      end
      refute @user.resolved
    end

    # should be resolved when marked resolved by author

  end
  end
