class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(status: 'approved')
      end
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
