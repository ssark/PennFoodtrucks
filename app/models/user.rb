class User < ActiveRecord::Base
  include BCrypt
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true,
    format: { with: REGEX, message: 'is not of valid format: something@example.com' }
  validate :name_valid
  has_many :ratings, dependent: :destroy

  def name_valid
    if name[0, 1] != name[0, 1].upcase && !name.nil?
      errors.add(:name, 'is not capitalized')
    end
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def valid_password(user_params)
    errors.add(:password, ' is empty') if user_params[:password].empty?
    !user_params[:password].empty?
  end
end
