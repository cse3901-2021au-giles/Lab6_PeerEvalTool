require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @rating = ratings(:one)
      end
      
      test "should get new" do
        get new_rating_url
        assert_response :success
      end
    
      test "should get show" do
        get rating_url(@rating)
        assert_response :success
      end
    
      test "should get edit" do
        get edit_rating_url(@rating)
        assert_response :success
      end
    
      test "should get index" do
        get ratings_url
        assert_response :success
      end

end
