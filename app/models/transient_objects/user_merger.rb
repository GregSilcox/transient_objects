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

  end
end
