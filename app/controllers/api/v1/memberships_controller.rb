module Api
  module V1
    class MembershipsController < Api::BaseController
      before_filter :restrict_access

      def index
        user = current_user
        render json: user.memberships
      end

      def create_organization
        user = current_user
        organization = Organization.new(name: params[:name])
        if organization.save
          membership = Membership.create!(user_id: user.id, organization_id: organization.id, is_admin: true)
          render json: membership
        else
          render json: { errors: organization.errors.messages }, status: :unprocessable_entity
        end
      end

      def destroy
        user = current_user
        membership = user.memberships.find(params[:id])
        if membership && membership.destroy
          render json: {}, status: :ok
        else
          render json: {}, status: :unprocessable_entity
        end
      end

    end
  end
end