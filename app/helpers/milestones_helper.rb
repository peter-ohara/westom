module MilestonesHelper
  def milestone_percentage(milestone)
    return "#{(milestone.progress.to_f / milestone.target) * 100}%" if milestone.target_type == :deals.to_s

    "#{(milestone.progress / milestone.target) * 100}%"
  end

  def milestone_fraction(milestone)
    return "#{milestone.progress} / #{milestone.target}" if milestone.target_type == :deals.to_s

    "#{humanized_money_with_symbol milestone.progress} / #{humanized_money_with_symbol milestone.target}"
  end

  def format_target(milestone)
    return milestone.target if milestone.target_type == :deals.to_s

    humanized_money_with_symbol milestone.target
  end
end
