class Checkout < ApplicationRecord
  validates :full_name,presence: {message:"! Name can't be blank"},length:{maximum:20 , message:"! Name is too long(maximum is 20 characters)"}
  validates :email, presence: {message:"! Email can't be blank"}, format: { with:  /([a-zA-Z\d\.-]+)@([a-zA-Z\d-]+)\.([a-zA-Z]{2,8})(\.(a-zA-Z){2,8})?/, message: "! Invalid email format. Please enter it again." }
  validates :phone_number, presence: {message:"! Phone number can't be blank"}, length: { maximum: 13, message: "! Phone number must be equal to 12 characters" }, format: { with: /\A\+92\d{10}\z/, message: "! Phone number must be a valid Pakistan phone number" }
  validates :province,presence: {message:"! Province can't be blank"}
  validates :city,presence: {message:"! City can't be blank"}
  validates :address,presence: {message:"! Address can't be blank"}
  validates :payment_method,presence: {message:"! Select method"}
end
