class CityPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

#   def permitted_attributes_for_create
#     if user.admin?
#     [:name, :country, places_attributes: [:name, :category, :_destroy]]
#   end
# end

#   def permitted_attributes_for_update
#     if user.superadmin?
#       [:name]
#   end
# end


  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
   user.present?
  end

  def update? 
user.present?
  end

  def attach_kit?
  update?
  end

  def download_logo?
    user.present?
  end
  
  def destroy?
    user.present?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
  #   def resolve
  #     if user.admin?
  #     scope.all
  #   end
  # end
end
end


