class StopPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def update?
    record.trip.user == user
  end

  def edit?
    record.trip.user == user
  end

  def create?
    record.trip.user == user
  end

  def destroy?
    record.trip.user == user
  end

  # NOTE: Be explicit about which records you allow access to!
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
