class TwitterListsController 
  def new
    twitter_api = ApiTwitter.new
    new_list = twitter_api.new_list(name)
  end

  def my_lists
    new_list = twitter_api.get_lists
  end

  def add_single_member(list_name, members_array)
    id = get_list_id(list_name)
    members_array.map do |member|
      twitter_api.addSingleMember(id, member)
    end
  end

  def add_multuple_members(list_name, members_array)
    id = get_list_id(list_name)
    twitter_api.addMembers(id, screen_names)
    end
  end

  def index
    tweets = Tweet.all
    render json: tweets
  end

  def get_list_id(name)
    list = TwitterList.find_by(name: params[:name])
    if list
      list_id = list.id
    end
  end


end
