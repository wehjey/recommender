require 'user_based_recommendation'

class Recommend
    attr_reader :item, :order_details, :data
    attr_accessor :type

    # @param type = This is the type of recommendation to be performed e.g UserBasedRecommendation.new
    # @param item = This is the object the recommendation will be performed for e.g user
    # @param order_details = Hash containing array of users ordered menu items
    # @param data = Matrix data of users against their purchase count of menu items
    def initialize(type, item, order_details = [], data)
        @type = type
        @item = item
        @order_details = order_details
        @data = data
    end

    # Returns hash of user previous menus and new recommended menu items
    def recommendation()
        if @type == 'user_based'
            UserBasedRecommendation.new.recommendation(self)
        end
    end
end