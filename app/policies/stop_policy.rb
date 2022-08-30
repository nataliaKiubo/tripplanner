class StopPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
