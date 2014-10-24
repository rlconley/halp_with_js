require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  context "a note" do
    subject { notes(:one) }

    should belong_to(:question)
    should belong_to(:user)

    should validate_presence_of(:text)
  end
end
