require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest
	test 'users signup test' do
		get new_user_registration_path
		assert_response :success
		assert_select "h2", "Регистрация"
		user_params = {
			email: 'user@test.me',
			password: 'foo1111',
			password_confirmation: 'foo1111'
		}
		post user_registration_path, params: { users: user_params }
		assert_response :success
		flash[:success]
		get root_path
		assert_response :success
		assert_select "h1", "Новости"
		assert_response :success
	end
end