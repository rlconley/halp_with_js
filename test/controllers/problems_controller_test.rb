require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  setup do
    @problem = problems(:one)
    @user = users(:one)
  end

  context "request GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template('new')
  end

  context "request POST :create" do
    context "with invalid problem info" do
    setup {post :create, { problem: { user_id: @user.id, description: @problem.description, tried: "" } } }
      should "not save a problem" do
        assert assigns[:problem].invalid?
      end
      should render_template('new')
    end

    context "with valid problem info" do
      setup {post :create, { problem: { user_id: @user.id, description: @problem.description, tried: @problem.tried } } }
      should "save the problem" do
        assert assigns[:problem]
        assert assigns[:problem].persisted?
      end
      should "redirect to problem's show view" do
        assert_redirected_to problem_path(assigns(:problem))
      end
    end
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
    # should render_template(partial: 'notes/new')
  end

end