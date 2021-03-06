require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  context "a note" do
    subject { notes(:one) }

    should belong_to(:problem)
    should belong_to(:user)

    should validate_presence_of(:text)
    should validate_presence_of(:user)
    should validate_presence_of(:problem)
  end
end
