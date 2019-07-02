class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 7, maximum: 30 }
  validates :identification, presence: true, uniqueness: { case_sensitive: false },
                             numericality: true, length: { in: 8..12 }
  validates :professional_card, presence: true, uniqueness: { case_sensitive: false },
                                numericality: true, length: { in: 8..20 }
  validates :birthdate, presence: true
  validates :speciality, presence: true
  validate :birhdate_cannot_be_in_the_future

  def birhdate_cannot_be_in_the_future
    if birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, "can't be in the future.")
    end
  end
end
