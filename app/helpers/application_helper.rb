module ApplicationHelper
  def preview_admin
    current_admin == Admin.find_by(email: 'preview@hannahbauer.me')
  end
end
