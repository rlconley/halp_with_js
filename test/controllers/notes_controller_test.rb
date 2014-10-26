require 'test_helper'

class NotesControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    @user_two = users(:two)
    @problem_two = problems(:two)
    @note = notes(:one)
    @note_three = notes(:three)
    @self_note = notes(:three)
  end

  context "request POST :create" do

    context "with invalid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem_two.id, text: "" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
      assert_redirected_to problem_path(@problem_two)
      end
      should "instantiate an invalid note" do
        assert assigns[:note].invalid?
      end
    end

    context "with valid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem_two.id, text: "asdf" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
        assert_redirected_to problem_path(@problem_two)
      end
      should "save a note" do
        assert assigns[:note]
        assert assigns[:note].persisted?
      end
      context "when the author adds a note" do

        setup do
          ActionMailer::Base.deliveries.clear
          post :create, { note: { user_id: @user_two.id, problem_id: @problem_two.id, text: "asdf" } }, {current_user_id: @user_two.id}
          # this note needs to be specified differently, because it's failing here but not on the server
        end
        should "not send an email" do
          assert_empty ActionMailer::Base.deliveries
        end

        # ActionMailer::Base.deliveries.clear
        # should "have test clear the deliveries array" do
        #   assert_empty ActionMailer::Base.deliveries
        # end

        # should "not send an email" do
        #   assert_no_difference 'ActionMailer::Base.deliveries.size' do
        #     post :create, { note: { user_id: @user_two.id, problem_id: @problem_two.id, text: "asdf" } }, {current_user_id: @user_two.id}
        #   end
        # end

      end
      context "when a non-author adds a note" do
        setup do
          ActionMailer::Base.deliveries.clear
          post :create, { note: { user_id: @user.id, problem_id: @problem_two.id, text: "asdf" } }, {current_user_id: @user.id}
        end
        should "send note_added email" do
          email = ActionMailer::Base.deliveries.last
          assert_equal "Note added on your problem", email.subject
          assert_equal @problem_two.user.email, email.to[0]
        end
      end
    end

  end

end
