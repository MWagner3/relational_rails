class Exhibit < ApplicationRecord
  belongs_to :zoo

  def zoo_name
    zoo.name
  end

end
