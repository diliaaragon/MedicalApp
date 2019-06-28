class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { in: 3..20 }
  validates :last_name, presence: true, length: { in: 7..30 }
  validates :identification, presence: true, uniqueness: { case_sensitive: false },
                             numericality: true, length: { in: 8..12 }
  validates :gender, presence: true, length: { maximum: 15 }
  validates :birthdate, presence: true
  validates :blood_type_rh, presence: true, length: { maximum: 3 }

  validate :birhdate_cannot_be_in_the_future

  def birhdate_cannot_be_in_the_future
    if birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, "can't be in the future.")
    end
  end
end
