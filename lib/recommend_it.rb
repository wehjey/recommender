require 'utils/similars'

class RecommendIt
    include Similars

    @DEFAULT_MAXIMUM_USER_SIZE = 10 # Default total number of users to base user recommendation on

    # Get recommendation
    # user => current logged in user
    # data => item purchase count matrix based on users
    def self.get_user_based_recommendation(user,data,order_details)
        similar_users = Similars.get_similar_users(user,data)
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
    def self.get_similars_menus(similar_users,order_details)
        number_of_users = similar_users.length
        similars_menus = Array.new
        if number_of_users < 10
            similar_users.each do |user_id, sim_index|
                get_all_similar_users_menu_items(order_details,user_id,similars_menus)
            end
        else
            i = 1
            similar_users.each do |user_id, sim_index|
                until i > @DEFAULT_MAXIMUM_USER_SIZE
                    get_all_similar_users_menu_items(order_details,user_id,similars_menus)
                end
            end
        end
        return similars_menus
    end

    # Returns an array containing all menu items ordered by similar users
    def self.get_all_similar_users_menu_items(order_details,user_id,menus)
        order_details[user_id].each do |menu|
            if !menus.include? menu
                menus.push(menu)
            end
        end
        return menus
    end

end