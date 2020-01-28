class QuotationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
    true  # Anyone can view a restaurant
  end

  def create?
    true  # Anyone can create a restaurant
  end

  def update?
    user_is_owner_or_admin # Only restaurant creator can update it
  end

  def destroy?
    user_is_owner_or_admin # Only restaurant creator can update it
  end

  private

  def user_is_owner_or_admin
    record.user == user  || user.admin
  end
end
