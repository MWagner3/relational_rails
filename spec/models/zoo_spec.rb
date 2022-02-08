require 'rails_helper'

RSpec.describe Zoo do

  describe 'relationships' do
    it {should have_many :exhibits}
  end


end
