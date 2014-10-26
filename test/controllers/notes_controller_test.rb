require 'test_helper'

class NotesControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    @problem = problems(:two)
    @note = notes(:one)
  end

  context "request POST :create" do

    context "with invalid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem.id, text: "" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
      assert_redirected_to problem_path(@problem)
      end
      should "instantiate an invalid note" do
        assert assigns[:note].invalid?
      end
    end

    context "with valid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem.id, text: "asdf" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
        assert_redirected_to problem_path(@problem)
      end
      should "save a note" do
        assert assigns[:note]
        assert assigns[:note].persisted?
      end
      should "send note_added email" do
        email = ActionMailer::Base.deliveries.last
        assert_equal "Note added on your problem", email.subject
      end
    end

  end

end
