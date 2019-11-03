module Mock
    # Mock data to use for testing purposes

    def self.d1_same_size
        return [1,2,4,5,1,6,4,4]
    end

    def self.d2_same_size
        return [1,0,4,4,1,2,4,3]
    end

    def self.d1_invalid_size
        return [1,2,4,5,4]
    end

    def self.order_details_similar
        return {
            1 => [1,3,5,7],
            2 => [1,4,3],
            3 => [9,77]
        }
    end

    def self.order_details_different
        return {
            1 => [61,63,5,7],
            2 => [1,4,3],
            3 => [9,77]
        }
    end

    def self.matrix_data
        return {
            1 => [1,0,8,0,0,3,6],
            2 => [0,2,0,0,3,0,6],
            3 => [1,0,8,0,0,3,0]
        }
    end

    def self.matrix_data_different
        return {
            1 => [1,0,8,0,0,3,6],
            2 => [0,2,0,0,3,0,0],
            3 => [0,0,0,1,0,0,0]
        }
    end

    def self.similarity_indexes
        return {
            3 => 0.8201995322647244,
            2 => 0.490352188754876
        }
    end
end