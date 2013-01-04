module TransientObjects
  class FamilyMemberMerger # < ActiveRecord::Base
    # attr_accessible :title, :body
    def initialize families
      @families = families
    end

    def families_with_duplicate_members
      families = Array.new
      @families.each do |family|
        duplicate_members = find_duplicate_members family
        families.push( [family, duplicate_members] ) unless 
          duplicate_members.empty?
      end
      families
    end

    def find_duplicate_members family
      duplicate_members = Array.new
       family.members.each do |member|
         family.members.each do |other|
           if member.name == other.name && member != other
             duplicate_members.push [member, other]
           end
         end
       end
      duplicate_members
    end

  end
end


