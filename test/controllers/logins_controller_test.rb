require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  context "request GET :new" do
    setup { get :new }

    should respond_with(:ok)
    should render_template(:new)

    should "instantiate a login object" do
      assert assigns[:login], "Should have a login"
    end
  end

  context "request POST :create" do
    setup {post :create}
    should respond_with(:ok)
  end

  context "request DELETE :destroy" do
    setup {delete :destroy}
    should respond_with(:ok)
  end

end
