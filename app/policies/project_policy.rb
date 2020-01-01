class ProjectPolicy < ApplicationPolicy
  def create?

    # First check if the user belongs to that company (the one to which the project will be created).
    # Then check whether he can make a project.

    participation = @user.participations.find_by(company_id: @record.company_id)
    return false if participation.nil?

    return participation.project_permission

  end

  def show?
    joined_project = @user.project_participations.find_by(project_id: @record.id)
    !joined_project.nil?
  end
end