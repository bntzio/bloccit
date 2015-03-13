class SummaryPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def edit?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    edit?
  end

  def new?
    create? 
  end

end
