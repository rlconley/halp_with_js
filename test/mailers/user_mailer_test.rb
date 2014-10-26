require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  context
  should "send a problem posted" do
    user = users(:one)
    mail = UserMailer.problem_posted(user, "You got a problem")
    assert_equal "You've got a problem", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@halp.com"], mail.from
  end
end
