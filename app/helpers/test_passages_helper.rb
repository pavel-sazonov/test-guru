module TestPassagesHelper
  # def result(test_passage)
  #   percents = "#{test_passage.success_rate}%"

  #   if @test_passage.test_done?
  #     class_name = :passed
  #     message = 'Тест пройден'
  #   else
  #     class_name = :failed
  #     message = 'Тест не пройден'
  #   end

  #   "#{tag.span percents, class: class_name}#{tag.br}#{tag.span message}".html_safe
  # end

  def percents(test_passage)
    "#{test_passage.rate}%"
  end
end
