class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable, :trackable,
  # :lockable, :timeoutable and :omniauthable, :rememberable, :recoverable
  devise :database_authenticatable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password

  def self.authenticate options
    user = find_by_email options[:email]
    user if user && user.valid_password?(options[:password])
  end
end
