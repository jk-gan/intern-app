class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    is_admin?
  end

  def create?
    is_admin?
  end

  def edit?
    is_admin?
  end

  def update?
    is_admin?
  end

  private

  def is_admin?
    user&.admin?
  end
end
