class User < ActiveRecord::Base
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.last_name.upcase}, #{self.first_name.upcase}"
  end
end
