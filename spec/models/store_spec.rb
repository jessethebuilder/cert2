require 'spec_helper'

describe Store do
  let(:store){ create :store }

  describe 'Validations' do
    it{ should validate_presence_of :name}
    it{ should validate_presence_of :minimum_certificate_amount }
    it{ should validate_numericality_of(:minimum_certificate_amount) }
    it 'should be invalid if minimum_certificate_amount is 0 or less' do
      store.minimum_certificate_amount = 0
      store.should_not be_valid
    end

    describe 'single store' do
      specify 'if a store already exists, a new store will not save' do
        store.save!
        new_store = build :store
        new_store.should_not be_valid
      end
    end
  end

  describe 'Associations' do
    it{ should have_one :social_networking_profile }
    it{ should have_many :addresses }
  end
end
