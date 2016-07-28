# == Schema Information
#
# Table name: academies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  cnpj        :string
#  phone       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_academies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_b719417cd0  (user_id => users.id)
#

class Academy < ApplicationRecord
  belongs_to :user
end
