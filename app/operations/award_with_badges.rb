class AwardWithBadges
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 'level'
        award!(badge) if passed_level_rule?(badge.rule_value.to_i)
      when 'category'
        award!(badge) if passed_category_rule?(badge.rule_value)
      when 'attempt'
        award!(badge) if passed_attempt_rule?(badge.rule_value.to_i)
      end
    end
  end

  private

  def award!(badge)
    @user.badges.push(badge)
  end

  def passed_level_rule?(level)
    if @test_passage.test.level == level
      @user.tests.where('test_passages.correct_questions = ?', 1)
                 .by_level(level).count == Test.all.by_level(level).count
    end
  end

  def passed_category_rule?(category)
    if @test_passage.test.category.title == category
      @user.tests.where('test_passages.correct_questions = ?', 1)
                 .by_category(category).count == Test.all.by_category(category).count
    end
  end

  def passed_attempt_rule?(attempts)
    @user.tests.where(id: @test_passage.test_id).count == attempts
  end
end
