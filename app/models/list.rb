require 'byebug'
class List < ApplicationRecord


  def new
    # twitter_api = ApiTwitter.new
    new_list = ApiTwitter.new_list(name)
  end

  def add_single_member(list_name, members_array=[])

    byebug
    # list_id = List.where(name:list_name).map(&:id_str)[0].to_i
    # slug = List.where(name:name).map(&:slug)[0]

    # list_id = List.find_by(name:list_name).id_str.to_i

    list_item = List.find_by(name:list_name)
    list_id = list_item.id_str
    slug = list_item.slug


    members_array.map do |member|
      self.twitter_api.addSingleMember(slug, list_id, member)
    end
  end

  def add_multiple_members(list_name, members_array)
    id = get_list_id(list_name)
    twitter_api.addMultipleMembers(id, members_array)

  end



  end
