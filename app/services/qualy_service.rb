class QualyService

  def initialize
    @pole = nil
    @grid = []
    @second_driver = 0
    end
  end

  def first_drivers
    first_driver = 0
    team = 0
    10.times do
      driver = Team.find_by(id: team + 1)
      puts driver
    end
  end
end
