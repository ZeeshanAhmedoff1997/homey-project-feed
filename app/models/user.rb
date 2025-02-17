class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_projects, class_name: "Project", foreign_key: "user_id", dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :project_feeds, dependent: :destroy

  validates :email, presence: true, uniqueness: true

end
