require 'test_helper'
class PostsTest < ActionDispatch::IntegrationTest
	test 'post test' do
	    get "/"
	    assert_select "h1", "Новости"
	end
end