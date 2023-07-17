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
    case user.experience
    when 0
      "#{user.first_name} #{user.last_name} is a new figure in the paddock. Not much can be said in terms of experience
      but there are a lot of expectations from part of the press."
    when 1..3
      "#{user.first_name} #{user.last_name} started working with the low-tier teams not so long ago, and seem to have
      the necessary skills to keep improving and become a stronger reference among the teams."
    when 4..7
      "#{user.first_name} #{user.last_name} is an experienced manager, slowly but surely raising eyebrows across the team principals."
    when 8..9
      "#{user.first_name} #{user.last_name} is one of the most experienced managers out there. Beyond talent, consistency and
      resiliency is crucial in the making of any big name in motor racing."
    when 10
      "#{user.first_name} #{user.last_name} is well known throughout the whole paddock. After so many races directly influencing
      teams results, there's no doubt that F1 will remeber this for years."
    else
      "#{user.first_name} #{user.last_name} is the boss!"
    end
  end

  def check_user_prestige(user)
    case user.prestige
    when 0..3
      "Within the business of F1, reputation is a big factor in one's opportunities. Currently, #{user.first_name} is only
      talking with the back of the grid."
    when 4..6
      "More than half of the teams show interest in working with a rising star. The opportunities are getting bigger and bigger,
      but also the pressure for stronger results is also higher."
    when 7..9
      "All the team principals agree that we're seeing a game changer. It's hard to find a more disputed name
      among the managers today."
    when 10
      "Currently the best and most impeccable manager in the sport, no question!"
    else
      "Rock solid!"
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
