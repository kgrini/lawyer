# (10000).times do
#   User.create(firstname: Vydumschik::Name.first_name, lastname: Vydumschik::Name.surname)
# end

# Keyword.all.each do |record|
#   # unless record.translit
#    record.update_attributes(translit: Keyword.generate_russian_translit(record.keyword).split(" ").join("_"))
#   # end
# end

Question.where(user_id: 30000).all.each do |question|
  question.update(user_id: User.order("RAND()").limit(1).first.id)
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


