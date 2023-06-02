class Category < ApplicationRecord
  has_many :products
  validates :name,presence:{message:"!Title can't be blank"}
  
  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term",
    search_term: "%#{search_term.downcase}%")
  end

end
