require 'spec_helper'
describe 'purgefiles' do

  context 'with defaults for all parameters' do
    it { should contain_class('purgefiles') }
  end
end
