require 'utils/similars'

class UserBasedRecommendation
    include Similars

    # Get recommendation
    # user => current logged in user
    # data => item purchase count matrix based on users
    def recommendation(context)
        user = context.item
        data = context.data
        order_details = context.order_details
        similar_users = Similars.get_similars(user,data)
        result = Hash.new
        if similar_users.length > 0
            user_menus = Array.new
            user_menus = order_details[user.id]
            similars_menus = get_similars_menus(similar_users,order_details)
            recommend = Array.new
            similars_menus.each do |s|
                if !user_menus.include? s
                    recommend.push(s)
                end
            end
            result[:user] = user_menus
            result[:recommendation] = recommend
        end
        return result
    end

    # Returns all similars menu items
    def get_similars_menus(similar_users,order_details)
        similars_menus = Array.new
        similar_users.each do |user_id, sim_index|
            get_all_similar_users_menu_items(order_details,user_id,similars_menus)
        end
        return similars_menus
    end

    # Returns an array containing all menu items ordered by similar users
    def get_all_similar_users_menu_items(order_details,user_id,menus)
        order_details[user_id].each do |menu|
            if !menus.include? menu
                menus.push(menu)
            end
        end
        return menus
    end

end