class TripPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def copy?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def toggle_favorite?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
