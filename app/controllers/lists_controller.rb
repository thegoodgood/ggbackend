require 'byebug'
class ListsController < ApplicationController
  skip_before_action :authorized, only: [ :new, :get_lists, :index]

  def new
    twitter_api = ApiTwitter.new
    new_list = twitter_api.new_list(name)
  end

  def index
    lists = List.all
    render json: lists
  end

  def get_lists
    lists  = List.all
    lists.destroy_all
    twitter_api = ApiTwitter.new
    my_lists = twitter_api.get_lists
    my_lists["lists"].map do |list|
          List.create(
             id_str: list["id_str"],
             slug: list["slug"],
             name: list["name"],
             uri: list["uri"],
             subscriber_count: list["subscriber_count"],
             mode: list["mode"],
             description: list["description "]
          )
    end
    render json: get_lists
  end

  def add_single_member(list_name, members_array)
    id = get_list_id(list_name)
    members_array.map do |member|
      twitter_api.addSingleMember(id, member)
    end
  end

  # def add_multuple_members(list_name, members_array)
  #   id = get_list_id(list_name)
  #   twitter_api.addMembers(id, screen_names)
  #   end
  # end



  def search_api
    term = params[:topic]
    get_list(term)
  end

  def get_list_id(name)
    list = List.find_by(id_str: params[:id_str])
    if list
      list_id = list.id
    end

    # def get_params
    #   params.require(:lists).permit(:id_str, :slug, :name, :uri, :subscriber_count, :mode, :description)
    # end
  end
