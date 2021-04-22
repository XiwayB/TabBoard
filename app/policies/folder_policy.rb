class FolderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.admin
      scope.all
      # else
      # scope.where(user: user)
      # end
    end
  end

  def fetch_folders?
    true
  end

  def create?
    true
  end

  def show?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def like?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user || record.shares.where(shares: {user: user}).present?
  end
end
