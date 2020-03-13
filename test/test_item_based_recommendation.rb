require 'minitest/autorun'
require 'item_based_recommendation'
require 'recommend'
require 'utils/similars'
require 'utils/item_based_mock'
require 'models/menu'

class ItemBasedRecommendationTest < Minitest::Test
    include Similars
    include ItemBasedMock

    def setup
        @menu = Menu.new(1)
    end

    # Test that result of recommendation from users that are not similar is  {}
    def test_return_empty_hash_if_no_similar_items
        assert_equal({}, item_based_recommendation(ItemBasedMock.matrix_data_different).recommendation)
    end

    # Test that the result from recommend method returns user menu items and recommended menu items
    def test_return_hash_of_recommendations
        assert_equal({
            :recommendation => [4, 5, 2, 3, 6]
            },
            item_based_recommendation(ItemBasedMock.matrix_data).recommendation)
    end

    # Initialize Recommend class for user based recommendation
    def item_based_recommendation(matrix_data)
        Recommend.new(ItemBasedRecommendation.new,@menu,[],matrix_data)
    end

end
