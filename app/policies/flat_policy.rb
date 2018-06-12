class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    !@user.nil?
  end

  def create?
    !@user.nil?
  end

  def edit?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end


