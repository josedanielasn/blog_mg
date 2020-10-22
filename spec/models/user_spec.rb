require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) {create(:user, username: 'test', email: 'test@email')}
  
  context "when validated" do

    context "when user is valid" do
      let(:valid_user) {create(:user)}

      it {expect(valid_user).to be_valid}
    end

    context "when username is invalid" do
      let(:username1) {build(:user, username: 'test')}
      let(:username2) {build(:user, username: '1')}
      let(:username3) {build(:user, username: '1' * 16)}
      let(:username4) {build(:user, username: nil)}

      it {expect(username1).to_not be_valid}
      it {expect(username2).to_not be_valid}
      it {expect(username3).to_not be_valid}
      it {expect(username4).to_not be_valid}
      
    end

    context "when firstname is invalid" do
      let(:firstname1) {build(:user, firstname: '1')}
      let(:firstname2) {build(:user, firstname: '1' * 16)}
      let(:firstname3) {build(:user, firstname: nil)}

      it {expect(firstname1).to_not be_valid}
      it {expect(firstname2).to_not be_valid}
      it {expect(firstname3).to_not be_valid}
      
    end

    context "when lastname is invalid" do
      let(:lastname1) {build(:user, lastname: '1')}
      let(:lastname2) {build(:user, lastname: '1' * 16)}
      let(:lastname3) {build(:user, lastname: nil)}

      it {expect(lastname1).to_not be_valid}
      it {expect(lastname2).to_not be_valid}
      it {expect(lastname3).to_not be_valid}
      
    end
    
  end
  
end
