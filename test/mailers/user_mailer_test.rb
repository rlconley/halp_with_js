require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  context "problem posted email" do
    should "contain correct subject and addresses" do
      user = users(:one)
      problem = problems(:one)
      mail = UserMailer.problem_posted(user, problem)
      assert_equal "You've got a problem", mail.subject
      assert_equal [user.email], mail.to
      assert_equal ["noreply@secret-cliffs-4141.herokuapp.com"], mail.from
    end
end

  context "note added email" do
    should "contain correct subject and addresses" do
      # user = users(:one)
      note = notes(:one)
      mail = UserMailer.note_added(note.problem.user, note)
      assert_equal "Note added on your problem", mail.subject
      assert_equal [note.problem.user.email], mail.to
      assert_equal ["noreply@secret-cliffs-4141.herokuapp.com"], mail.from
    end
  end
end