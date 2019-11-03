require 'minitest/autorun'
require 'recommend_it'
require 'utils/similars'
require 'utils/mock'
require 'models/user'

class RecommendItTest < Minitest::Test
    include Similars
    include Mock

    def setup
        @user = User.new(1)
    end

    def test_return_empty_hash_if_no_similar_users
        assert_equal({}, RecommendIt.get_user_based_recommendation(@user,Mock.matrix_data_different,Mock.order_details_different))
    end

    def test_return_hash_of_user_menu_and_recommendations
        assert_equal({
            :user => [61, 63, 5, 7],
            :recommendation => [9, 77, 1, 4, 3]
            },
            RecommendIt.get_user_based_recommendation(@user,Mock.matrix_data,Mock.order_details_different))
    end

    def test_returns_similar_menus_for_similar_users
        similar_users = Similars.get_similar_users(@user,Mock.matrix_data)
        assert_equal([9, 77, 1, 4, 3], RecommendIt.get_similars_menus(similar_users,Mock.order_details_similar))
    end

end
