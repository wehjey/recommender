require 'minitest/autorun'
require 'user_based_recommendation'
require 'recommend'
require 'utils/similars'
require 'utils/user_based_mock'
require 'models/user'

class UserBasedRecommendationTest < Minitest::Test
    include Similars
    include UserBasedMock

    def setup
        @user = User.new(1)
    end

    # Test that result of recommendation from users that are not similar is  {}
    def test_return_empty_hash_if_no_similar_users
        assert_equal({}, user_based_recommendation(UserBasedMock.order_details_different,UserBasedMock.matrix_data_different).recommendation)
    end

    # Test that the result from recommend method returns user menu items and recommended menu items
    def test_return_hash_of_user_menu_and_recommendations
        assert_equal({
            :user => [61, 63, 5, 7],
            :recommendation => [9, 77, 1, 4, 3]
            },
            user_based_recommendation(UserBasedMock.order_details_different,UserBasedMock.matrix_data).recommendation)
    end

    # Test that method returns menu items of similar users
    def test_returns_similar_menus_for_similar_users
        similar_users = Similars.get_similars(@user,UserBasedMock.matrix_data)
        assert_equal([9, 77, 1, 4, 3], UserBasedRecommendation.new.get_similars_menus(similar_users,UserBasedMock.order_details_similar))
    end

    # Initialize Recommend class for user based recommendation
    def user_based_recommendation(order_details,matrix_data)
        Recommend.new(UserBasedRecommendation.new,@user,order_details,matrix_data)
    end

end
