class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    !@user.nil?
  end

  def create?
    !@user.nil?
  end

  def edit?
    @record.user == @user || @user.admin
  end

  def update?
    @record.user == @user || @user.admin
  end

  def destroy?
    @record.user == @user || @user.admin
  end
end
