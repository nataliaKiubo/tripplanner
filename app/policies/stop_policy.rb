class StopPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
