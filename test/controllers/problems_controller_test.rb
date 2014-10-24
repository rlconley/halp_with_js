require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  context "request GET :new" do
    setup { get :new }
    should respond_with(:ok)
  end

  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)
  end

  context "request GET :index" do
    setup { get :index }
    should respond_with(:ok)
  end

  context "request GET :show" do
    setup { get :show }
    should respond_with(:ok)
  end

end
