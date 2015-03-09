class CommentPolicy < ApplicationPolicy
  def new
    create?
  end

  def create
    user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end