class User < ApplicationRecord
  rolify
  validates :first_name,presence: {message:"! First name can't be blank"}, format: { with: /\A[a-zA-Z]+\z/, message: "! First name only allows letters" },length:{maximum:20 , message:"! First name is too long(maximum is 20 characters)"}
  validates :last_name,presence:{message:"! Last name can't be blank"}, format: { with: /\A[a-zA-Z]+\z/, message: "! Last name only allows letters" },length:{maximum:20 , message:"! Last name is too long(maximum is 20 characters)"}
  validates :email, presence: {message:"! Email can't be blank"}, format: { with:  /([a-zA-Z\d\.-]+)@([a-zA-Z\d-]+)\.([a-zA-Z]{2,8})(\.(a-zA-Z){2,8})?/, message: "! Invalid email format. Please enter it again." }, uniqueness:{message:"! Email has already been taken"}
  validates :contact_number, presence: {message:"! Contact number can't be blank"}, length: { maximum: 13, message: "! Contact number must be equal to 12 characters" }, format: { with: /\A\+92\d{10}\z/, message: "! Contact number must be a valid Pakistan phone number" }
  ROLES = %w[Admin Vendor Customer]
  validates :role, inclusion: { in: ROLES , message:"! Select trade role" }
  validates :password, presence: {message:"! Password can't be blank"},length:{minimum:6 , message:"! Password is too short(minimum is 6 characters)"}, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()])/, message: "! Password include one lowercase, one uppercase and one special character" }
  validates :terms_and_conditions, acceptance: {message:"! Check the agreement"}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end



  
