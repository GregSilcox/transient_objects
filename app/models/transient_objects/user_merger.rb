module TransientObjects
  class UserMerger # < ActiveRecord::Base
    # attr_accessible :title, :body
    def initialize users
      @users = users
    end

    def users_with_multiple_families
      users_multi = Array.new
      @users.each do |user|
        users_multi.push( user ) if user.families.uniq.count > 1
      end
      users_multi
    end

    def families
      families = Array.new
      @users.each do |user|
        fmm = FamilyMemberMerger.new user.families
        dups = fmm.families_with_duplicate_members
        families.push( [ user, dups ] ) unless 
          dups.empty?
      end
      families
    end

    def merge_duplicate_users structure
      u1 = structure[1][0][1][0][0]
      u2 = structure[1][0][1][0][1]
      if u2.links.empty?
        u1.merge u2
      else
        u2.merge u1
      end
    end

  end
end
