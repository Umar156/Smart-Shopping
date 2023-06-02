class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables


  def total
    orderables.to_a.sum{ |orderable| orderable.total}
  end

  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term",
    search_term: "%#{search_term.downcase}%")
  end
end
