class Product < ApplicationRecord
  has_one_attached :avatar
  validates :name,presence:{message:"!Title can't be blank"}
  validates :description,presence:{message:"!Description can't be blank"}, length: { minimum: 30, message:"!Description is too short(minimum is 30 characters)" }
  validates :avatar,presence:{message:"!Image can't be blank"}
  validates :price,presence:{message:"!Price can't be blank"}, numericality: { float:true, greater_than_or_equal_to: 0.0, message: "!Price must be a positive integer" }
  validates :quantity,presence:{message:"!Quantity can't be blank"}, numericality: { only_integer: true,greater_than_or_equal_to: 0, message: "!Quantity must be a positive integer" }
end
