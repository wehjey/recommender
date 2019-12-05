require 'utils/similars'
require 'recommender'
class ItemBasedRecommendation < Recommender
    include Similars

    # Get recommendation for item
    # item => menu item to get recommendation for
    # data => matrix collection of item's views and orders
    def recommendation(context)
        item = context.item
        data = context.data
        similar_items = Similars.get_similars(item,data)
        result = Hash.new
        if similar_items.length > 0
            recommend = Array.new
            similar_items.each do |key, sim_index|
                recommend.push(key)
            end
            result[:recommendation] = recommend
        end
        return result
    end

end