class User < ActiveRecord::Base
  ROLES = %w(guest employee administrator)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :first_name, :last_name, :middle_name,
      :department_id, :position, :role

  default_scope order: :login

  has_and_belongs_to_many :tasks
  belongs_to :department

  validates :login, presence: true
  validates :login, uniqueness: true, length: { within: 4..36 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :department, presence: true
  validates :position, presence: true

  def email_required?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login).downcase
    where(conditions).where(["lower(login) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end

  def role?(base_role)
    return false unless role
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end


end
