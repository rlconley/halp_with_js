require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)
  end

end
