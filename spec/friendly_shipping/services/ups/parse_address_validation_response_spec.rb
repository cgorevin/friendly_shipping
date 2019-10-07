# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FriendlyShipping::Services::Ups::ParseAddressValidationResponse do
  let(:response_body) { File.open(File.join(gem_root, 'spec', 'fixtures', 'ups', 'address_validation_response.xml')).read }
  let(:request) { double }
  let(:response) { double(body: response_body) }
  let(:location) { double }

  subject { described_class.call(_request: request, response: response, _location: location) }

  context 'with a successful request' do
    it { is_expected.to be_success }

    it 'returns the address with address type' do
      address = subject.value!
      expect(address).to be_a(Physical::Location)
      expect(address.address1).to eq('4025 ABBEY LN')
      expect(address.city).to eq('ASTORIA')
      expect(address.region.name).to eq('Oregon')
      expect(address.country.name).to eq('United States')
      expect(address.zip).to eq('97103')
      expect(address.address_type).to eq('commercial')
    end
  end

  context 'with a no-candidates request' do
    let(:response_body) { File.open(File.join(gem_root, 'spec', 'fixtures', 'ups', 'address_validation_no_candidates_response.xml')).read }

    it { is_expected.to be_failure }

    it 'has the correct error message' do
      expect(subject.failure.to_s).to eq("Address is probably invalid. No similar valid addresses found.")
    end
  end
end
