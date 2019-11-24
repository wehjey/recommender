module Similars

    # Calculate similarity index using the cosine similarity model
    # Formula is defined as cos(d1,d2) = (d1●d2)/||d1|| * ||d2||
    # (d1●d2) is known as the dot product i.e multiplying each attributes of the document vectors by each other
    # ||d1||, ||d2|| is defined as magnitude
    # Document vector magnitude is calculated by squaring each document vector attribute and find the square root of the sum
    def self.similarity_index(d1,d2)
        d2 = fix_missing_values(d1,d2)
        dot_product = calculate_dot_product(d1,d2)
        d1_magnitude = calculate_vector_magnitude(d1)
        d2_magnitude = calculate_vector_magnitude(d2)
        return dot_product / (d1_magnitude * d2_magnitude) # convert to  values to float before calculation so decimal places will not be lost
    end

    # Find dot product of the document vectors
    # Dot product is done by mutliplying attribute by attribute of each document vector
    def self.calculate_dot_product(d1,d2)
        sum = 0
        i = 0
        while i < d1.length
            sum = sum + d1[i] * d2[i]
            i += 1
        end
        return sum.to_f
    end

    # Document vector magnitude is calculated by summing up the squares of each attribute and finding the square root of the sum
    def self.calculate_vector_magnitude(vector)
        sum = 0
        i = 0
        while i < vector.length
            sum = sum + vector[i] * vector[i]
            i += 1
        end
        return Math.sqrt(sum).to_f
    end

    # Returns an array of similarity indexes
    # Sort the similarity indexes in descending order
    def self.get_similars(target,data)
        sim = Hash.new
        d1 = data[target.id]
        data.each do |key, d2|
            if key != target.id
                index = similarity_index(d1, d2)
                if index > 0 && !index.nan? # Only store records that have similarity index greater than 0 and is not NaN (NaN values are derived when document vector is filled with only zero values)
                    sim[key] = index
                end
            end
        end
        return sim.sort_by {|k,v| -v}.to_h # sort_by function converts hash to multidemsional array, so convert back to hash after sorting
    end

    # Fix vectors of varying length by adding zeros
    def self.fix_missing_values(d1,d2)
        i = 0
        length_diff = d1.length - d2.length
        if length_diff > 0
            while i < length_diff
                d2.push(0)
                i += 1
            end
        end
        return d2
    end
end