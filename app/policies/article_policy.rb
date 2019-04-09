class ArticlePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    user.creator? or user.admin?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
