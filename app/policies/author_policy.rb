class AuthorPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def destroy?
    index?
  end
end
