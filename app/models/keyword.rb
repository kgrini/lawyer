class Keyword < ActiveRecord::Base

  has_many :questions

  def self.select_21_link_in_random_order
    Rails.cache.fetch("keyword_random", :expires_in => 5.seconds) do
      select(:translit, :keyword).joins(questions: :user).uniq(:id).order("RAND()").first(21)
    end
  end

  def with_questions_and_users
    questions.includes(:user).includes(:answers)
  end

  def self.generate_russian_translit(text)
    translited = text.tr('абвгдеёзийклмнопрстуфхэыь', 'abvgdeezijklmnoprstufhey')
    translited = translited.tr('АБВГДЕЁЗИЙКЛМНОПРСТУФХЭ', 'ABVGDEEZIJKLMNOPRSTUFHEY')

    translited.gsub(/[жцчшщъюяЖЦЧШЩЪЮЯ]/,
                    'ж' => 'zh', 'ц' => 'ts', 'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sch', 'ъ' => '', 'ю' => 'ju', 'я' => 'ya',
                    'Ж' => 'ZH', 'Ц' => 'TS', 'Ч' => 'CH', 'Ш' => 'SH', 'Щ' => 'SCH', 'Ъ' => '', 'Ю' => 'JU', 'Я' => 'YA')
  end
end
