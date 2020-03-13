module ItemBasedMock

    # Matrix data for items
    # index 0 => number of views
    # index 1 => number of orders placed
    def self.matrix_data
        return {
            1 => [7,5],
            2 => [1,1],
            3 => [9,2],
            4 => [30,17],
            5 => [13,13],
            6 => [50,1]
        }
    end

    def self.matrix_data_different
        return {
            1 => [7,5],
            2 => [0,0]
        }
    end

    # Returns an array of items with similarity indexes
    def self.similarity_indexes
        return {
            4 => 0.9945239101364354,
            5 => 0.9863939238321439,
            2 => 0.9863939238321436,
            3 => 0.9204443524957583,
            6 => 0.8251932129390934
        }
    end

end