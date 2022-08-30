class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def update?
    record.id == user.id
  end

  def edit?
    record.id == user.id
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.all
    end
  end
end
