class Feedback < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  validates :company_token, :priority , presence: true
  validates :company_token, uniqueness: {scope: :number}

  PRIORITY = {minor: 0, major: 1, critical: 2}
  enum priority: PRIORITY

  belongs_to :state, dependent: :destroy

  auto_increment :number, scope: [:company_token], before: :create
  after_commit :update_cache

  scope :number, -> (number) { where(number: number) }
  scope :company_token, -> (token) { where(company_token: token) }
  scope :by_company_token, -> (token) { search(token) }

  settings do
   mappings dynamic: false do
     indexes :company_token, type: :text
   end
 end

  protected
    def update_cache
      Rails.cache.write company_token, number
    end
end
