# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.all.each do |content|
  unless content.firstname
    content.update_attributes(firstname: Vydumschik::Name.first_name, lastname: Vydumschik::Name.surname)
  end
end


Keyword.all.each do |record|
  unless record.translit
   record.update_attributes(translit: Keyword.generate_russian_translit(record.keyword).split(" ").join("_"))
  end
end

Question.all.each do |question|
  unless question.user_id
    if question.id == Question.first.id
      question.update(user_id: User.first.id)
    else
      prev_question_user_id = Question.find(question.id - 1).user_id
      question.update(user_id: User.find(prev_question_user_id + 1).id)
    end
  end
end

#------------------------------------------------------------------
#Test data

# 3.times do
#   User.create(firstname: nil, lastname: nil)
# end


# ['Здравствуйте! Будьте так любезны можно ли в момент рассмотрения заявления в суде об оспаривании постановления Судебного пристава обратиться в суд с заявлением о прекращении данного исполнительного производства в связи с фактическим исполнением',
#  'Добрый день! Меня интересует рассмотрение искового заявления в суд об установлении факта принятия наследства. мою маму вызывают в суд на рассмотрение искового заявления её бывшей свекрови к ней, об установлении факта принятия наследства моего отчима, который умер в 2011 году.',
#  'Нужен образец заявления в суд о взыскании со страховой 50% штрафа и неустойки  /пени/ за неисполнение в добровольном порядке выплат по УТС. Все необходимые документы поданы в страховую 17.11.2014,  а заявление в суд /о взыскании УТС 19.11.14.  Рассмотрение дела в суде назначено на 19.01.2015',
# ].each do |word|
#   Question.create(body: word, region: 'blablabla', keyword_id: Keyword.first.id, user_id: User.first.id)
# end

# [' рассмотрение дела участники административного дела',
# 'рассмотрение заявления в суде',
# 'рассмотрение заявления о разводе'].each do |word|
#   Keyword.create(keyword: word)
# end


