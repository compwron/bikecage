require_relative '../spec_helper'

describe CagesManager do
	let(:cage1) {Cage.new}
	let(:cage2) {Cage.new}
	let(:user1) {Account.new}
	let(:user2) {Account.new}
	let(:cm) {CagesManager.new(cages: [cage1, cage2], users: [user1, user2])}
	it "has cages and users passed in by parser" do
		expect(cm.cages).to include(cage1, cage2)
		expect(cm.users).to include(user1, user2)
	end

	it "enter cage by user" do
		cm.enter(cage1, user1.id)
	end

	it "does not allow nonuser to enter" do
		result = cm.enter(cage1, "nonuser")
		expect(result.success?).to eq false
		expect(result.errors).to include BikeCage::Error::User::NotAUser
	end

	it "does not allow account without enough to enter" do
		result = cm.enter(cage1, Account.new(funds: 0))
		expect(result.success?).to eq false
		expect(result.errors).to include BikeCage::Error::User::InsufficientFunds
	end

	it "has no error after same number of exits as enters" do
		cm.exit
	end

	it "has no error after 1 enter and 0 exit"
	it "has error after 1 enter and 0 exit after duration cutoff" do
		# Timecop.freeze

	end


	it "has an error after more exits than enters" do

	end
end