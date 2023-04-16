class Race < ApplicationRecord
  belongs_to :user
  belongs_to :circuit
  belongs_to :team01, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team02, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team03, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team04, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team05, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team06, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team07, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team08, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team09, class_name: 'Team', foreign_key: 'team_id'
  belongs_to :team10, class_name: 'Team', foreign_key: 'team_id'
end
