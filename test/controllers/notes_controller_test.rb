require 'test_helper'

class NotesControllerTest < ActionController::TestCase

  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)

    context "with invalid info" do
      setup { post :create, { user_id: users(:one).id, text: "" } }
      should render_template('/problems/index')

      # should "instantiate an invalid note" do
      #   assert assigns[:note].invalid?
      # end

      should "not save a note" do
      refute assigns[:note]
      end
    end

    context "with valid info" do
      setup { post :create, { user_id: users(:one).id, text: "asdf" } }
      should render_template('problems/index')

      should "save a note" do
        assert assigns[:note]
        assert assigns[:note].persisted?
      end
    end
  end
end
