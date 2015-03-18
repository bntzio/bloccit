class TopicPolicy < ApplicationPolicy

  def show?
    record.public? || user.present?
  end

  def index?
    true
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    create?
  end
end
