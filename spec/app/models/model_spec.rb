require 'spec_helper'
 
describe Model do
	describe "#new" do
		subject { Model.new }
		it { should be_an_instance_of(Model) }
	end
end
