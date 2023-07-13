module ApplicationHelper

  def check_photo(user)
    if user.photo_attachment.nil?
      image_tag "photo_base.png", class: "avatar dropdown-toggle", id: "navbarDropdown",
      data: { bs_toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    else
      cl_image_tag user.photo.key, class: "avatar dropdown-toggle", id: "navbarDropdown",
      data: { bs_toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    end
  end

  def show_user_photo(user)
    if user.photo.key
      cl_image_tag user.photo.key, height: 300, width: 300, crop: :fill, class:"profile-photo"
    else
      image_tag "photo_base.png", class:"profile-photo"
    end
  end

  def check_user_experience(user)
    if user.experience <= 1
      "NEWS: #{user.first_name} #{user.last_name}'s
      presence caught some of the press's attention earlier this year.
      Although not much can be said about the results, critics believe we'll see a good impact
      on the team working with their new manager."
    else
      "#{user.first_name} #{user.last_name} is the boss!"
    end
  end

  def team_tier(team)
    if team.id >= 1 && team.id < 4
      "#{team.name} is a top-tier team and they'll expect you to lead them to victories!"
    elsif team.id >= 4 && team.id < 7
      "#{team.name} is a mid-tier team, fighting for constant points, dreaming for a podium."
    else
      "#{team.name} is a low-tier team and they wish to find their way into the points."
    end
  end

  def team_description(team)
    if team.id >= 1 && team.id < 4
      "and will guide the team to make sure both drivers are bringing all available points home."
    elsif team.id >= 4 && team.id < 7
      "and your strategies will be crucial to make sure you lead the battle in the midfield."
    else
      "and you'll need to capitalize on any opportunities for the drivers to reach the top 10."
    end
  end
end
