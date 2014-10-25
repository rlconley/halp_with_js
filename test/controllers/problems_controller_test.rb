require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  context "request GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template('new')
  end

  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)

    # assert_redirected_to problem_path(assigns(:problem))
  end

  context "request GET :index" do
    setup { get :index }
    should respond_with(:ok)
    should render_template('index')
  end

  context "request GET :show" do
    setup { get :show, { id: problems(:one) } }
    should respond_with(:ok)
    should render_template('show')
  end

end
