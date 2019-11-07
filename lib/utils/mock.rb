module Mock
    # Mock data to use for testing purposes

    # Returns document vector of valid length
    def self.d1_same_size
        return [1,2,4,5,1,6,4,4]
    end

    # Returns document vector of valid length
    def self.d2_same_size
        return [1,0,4,4,1,2,4,3]
    end

    # Returns a document vector of invalid length
    def self.d1_invalid_size
        return [1,2,4,5,4]
    end

    # Returns users that have similar order details
    def self.order_details_similar
        return {
            1 => [1,3,5,7],
            2 => [1,4,3],
            3 => [9,77]
        }
    end

    # Returns users that have similar order details
    def self.order_details_similar_12
        return {
            1 => [1,3,5,7],
            2 => [1,4,3],
            3 => [9,77,44],
            4 => [1,5,7],
            5 => [1,4,3],
            6 => [9,4],
            7 => [1,3,5,7],
            8 => [1,4,3],
            9 => [2,77],
            10 => [1,3,7],
            11 => [1,4,3,13],
            12 => [9,5]
        }
    end

    # Returns users that have different order details
    def self.order_details_different
        return {
            1 => [61,63,5,7],
            2 => [1,4,3],
            3 => [9,77]
        }
    end

    # Returns users that have similar purchase count
    def self.matrix_data
        return {
            1 => [1,0,8,0,0,3,6],
            2 => [0,2,0,0,3,0,6],
            3 => [1,0,8,0,0,3,0]
        }
    end

    # Returns12 similar purchase count for users
    def self.matrix_data_12
        return {
            1 => [1,0,8,0,2,3,6],
            2 => [0,2,0,0,3,0,6],
            3 => [1,0,8,0,0,3,0],
            4 => [1,0,8,3,2,3,0],
            5 => [1,0,8,0,0,3,0],
            6 => [1,0,0,0,0,3,0],
            7 => [1,0,3,0,0,0,0],
            8 => [1,0,8,1,0,3,4],
            9 => [0,0,8,0,0,3,0],
            10 => [1,0,8,0,0,3,0],
            11 => [1,0,8,0,0,3,0],
            12 => [1,0,8,0,0,3,0]
        }
    end

    # Returns users that don't have similar purchase counts
    def self.matrix_data_different
        return {
            1 => [1,0,8,0,0,3,6],
            2 => [0,2,0,0,3,0,0],
            3 => [0,0,0,1,0,0,0]
        }
    end

    # Returns an array of users with similarity indexes
    def self.similarity_indexes
        return {
            3 => 0.8201995322647244,
            2 => 0.490352188754876
        }
    end
end