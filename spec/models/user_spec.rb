require 'spec_helper'

describe User do
  let(:user){ build :user }

  describe 'Validations' do
    it{ should validate_presence_of :email }
    it{ should validate_uniqueness_of :email }
    it{ should validate_presence_of :password }
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    #it{ should have_many(:certs).class_name }
    it{ should have_many :addresses }
  end

  describe 'Scopes' do
    describe '#not_opted_out' do
      it 'should return all users for which opt_out is NOT true' do
        user.save
        oo_user = create :opted_out_user
        User.count.should == 2
        User.not_opted_out.count.should == 1
        User.not_opted_out.first.should == user
      end
    end

    describe '#admins' do
      it 'should return all users for which admin is TRUE' do
        user.save
        admin = create :admin
        User.admins.count.should == 1
        User.admins.first.should == admin
      end
    end
  end
end
