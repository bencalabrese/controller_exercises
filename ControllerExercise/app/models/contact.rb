# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  validates :user_id, :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }

  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
end
