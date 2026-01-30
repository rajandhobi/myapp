class NilClassPolicy < ApplicationPolicy
  def show? 
    false 
  end

  def create? 
    false 
  end
   
  def update? 
    false 
  end 

  def destroy? 
    false 
  end 

  class Scope < ApplicationPolicy::Scope
    def resolve 
    raise Pundit::NotAuthorizedError, "nil class cannot be scoped"
    end
  end
end
