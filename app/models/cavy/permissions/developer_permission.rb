module Cavy
  module Permissions
    class DeveloperPermission < BasePermission

      def initialize(user)
        allow_all
      end

    end
  end
end