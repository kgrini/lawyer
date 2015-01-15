class Content < ActiveRecord::Base
  belongs_to :category
  before_create :set_random_links_to_field, :generate_translit_from_keywords

  def set_random_links_to_field
    self.links = get_random_content_id
  end

  def get_random_contents
    category.contents.select(:url, :keyword).order("RAND()").first(21)
  end


  def get_random_content_id
    "#{category.contents.order("RAND()").pluck(:id).first(10).join(",")}"
  end

  def generate_translit_from_keywords
    self.url = generate_russian_translit(self.keyword).split(" ").join("_")
  end

  def generate_russian_translit(text)
    translited = text.tr('абвгдеёзийклмнопрстуфхэыь', 'abvgdeezijklmnoprstufhey\'')
    translited = translited.tr('АБВГДЕЁЗИЙКЛМНОПРСТУФХЭ', 'ABVGDEEZIJKLMNOPRSTUFHEY\'')

    translited = translited.gsub(/[жцчшщъюяЖЦЧШЩЪЮЯ]/,
                                 'ж' => 'zh', 'ц' => 'ts', 'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sch', 'ъ' => '', 'ю' => 'ju', 'я' => 'ya',
                                 'Ж' => 'ZH', 'Ц' => 'TS', 'Ч' => 'CH', 'Ш' => 'SH', 'Щ' => 'SCH', 'Ъ' => '', 'Ю' => 'JU', 'Я' => 'YA')
    translited
  end
end
