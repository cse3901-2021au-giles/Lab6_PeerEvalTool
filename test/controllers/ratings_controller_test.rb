require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @rating = ratings(:one)
        @group = groups(:one)
      end
    
      test "should get edit" do
        get edit_rating_url(@rating)
        assert_response :redirect
      end
    
      test "should get index" do
        get ratings_url
        assert_response :redirect
      end

end
