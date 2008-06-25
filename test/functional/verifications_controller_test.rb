require 'test_helper'

class VerificationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:verifications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_verification
    assert_difference('Verification.count') do
      post :create, :verification => { }
    end

    assert_redirected_to verification_path(assigns(:verification))
  end

  def test_should_show_verification
    get :show, :id => verifications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => verifications(:one).id
    assert_response :success
  end

  def test_should_update_verification
    put :update, :id => verifications(:one).id, :verification => { }
    assert_redirected_to verification_path(assigns(:verification))
  end

  def test_should_destroy_verification
    assert_difference('Verification.count', -1) do
      delete :destroy, :id => verifications(:one).id
    end

    assert_redirected_to verifications_path
  end
end
