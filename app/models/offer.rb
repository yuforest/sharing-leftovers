class Offer < ApplicationRecord
  validates :leftover_id, uniqueness: { scope: :user_id,
    message: "同じオファーに対する申請はできません" }
end
