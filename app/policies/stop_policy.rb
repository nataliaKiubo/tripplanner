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

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
