require "spec_helper"

module Cavy
  describe Permissions::AdminPermission do
    subject { Permissions.permission_for(Cavy::User.create(email:'ss@ss.ss', password: 's', password_confirmation: 's', role: 'admin')) }

    it "allows anything" do
      should allow(:any, :thing)
      should allow_param(:any, :thing)
    end
  end
end