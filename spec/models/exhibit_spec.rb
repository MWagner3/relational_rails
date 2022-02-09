require 'rails_helper'

RSpec.describe Exhibit do
  describe 'relationships' do
    it {should belong_to :zoo}
  end

end
