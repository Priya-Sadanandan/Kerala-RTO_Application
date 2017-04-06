class Rtocode < ApplicationRecord

#  def self.search(search)
#    where("code LIKE ?", "%#{search}%") 
#    where("office LIKE ?", "%#{search}%")
#    where("district LIKE ?", "%#{search}%")
#  end

def self.search(search)
  where("code LIKE ? OR office LIKE ? OR district LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
