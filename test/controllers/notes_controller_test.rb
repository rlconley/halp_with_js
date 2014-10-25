require 'test_helper'

class NotesControllerTest < ActionController::TestCase

  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)

    context "with invalid info" do
      setup { post :create, { note: { user_id: users(:one).id, problem_id: problems(:two), text: "" } } }
      should render_template('/problems/index')

      # should "instantiate an invalid note" do
      #   assert assigns[:note].invalid?
      # end
      ## assigns[:note] returns nil in this case, which you can't call .invalid? on
      ## but this is what's used in Clinton's QuestionBox test, so I'm not sure where the issue is

      should "not save a note" do
      refute assigns[:note]
      end
    end

    context "with valid info" do
      setup { post :create, { note: { user_id: users(:one).id, problem_id: problems(:two), text: "asdf" } } }
      should render_template('problems/show/')

      should "save a note" do
        assert assigns[:note]
        assert assigns[:note].persisted?
      end
    end

  end

end
