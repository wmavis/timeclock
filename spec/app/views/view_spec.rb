require 'spec_helper'
 
describe View do
	describe "#new" do
		subject { View.new }
		it { should be_an_instance_of(View) }
	end
end
