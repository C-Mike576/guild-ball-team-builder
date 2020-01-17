class Team < ActiveRecord::Base
    belongs_to :user
    belongs_to :captian, class_name: "Player"
    belongs_to :mascot, class_name: "Player"
    belongs_to :squaddie_1, class_name: "Player"
    belongs_to :squaddie_2, class_name: "Player"
    belongs_to :squaddie_3, class_name: "Player"
    belongs_to :squaddie_4, class_name: "Player"
end
