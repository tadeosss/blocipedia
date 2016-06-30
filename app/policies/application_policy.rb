class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def scope
    Pundit.policy_scope!(user, wiki.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end