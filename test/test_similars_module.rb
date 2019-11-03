require 'minitest/autorun'
require 'utils/similars'
require 'utils/mock'
require 'models/user'

class SimilarsTest < Minitest::Test
    include Similars
    include Mock

    # Fix vectors of varying length by adding zeros
    def test_fix_missing_vector_attributes
        assert_equal([1,2,4,5,4,0,0,0], Similars.fix_missing_values(Mock.d2_same_size,Mock.d1_invalid_size))
    end

    # Similarity index must always be between 0 and 1
    def test_similarity_index_must_be_between_0_and_1
        assert_includes(0..1, Similars.similarity_index(Mock.d1_same_size,Mock.d2_same_size))
    end

    def test_similarity_index_value_is_correct
        assert_equal(0.9163795899053138, Similars.similarity_index(Mock.d1_same_size,Mock.d2_same_size))
    end

    def test_dot_product_value_is_correct
        assert_equal(78, Similars.calculate_dot_product(Mock.d1_same_size,Mock.d2_same_size))
    end

    def test_vector_magnitude_value_is_correct
        assert_equal(10.7238052947636083, Similars.calculate_vector_magnitude(Mock.d1_same_size))
    end

    def test_similar_users
        user = User.new(1)
        assert_equal(Mock.similarity_indexes, Similars.get_similar_users(user,Mock.matrix_data))
    end

end
