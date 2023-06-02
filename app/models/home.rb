class Home < ApplicationRecord
  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term OR LOWER(price) LIKE :search_term ",
    search_term: "%#{search_term.downcase}%")
  end
end