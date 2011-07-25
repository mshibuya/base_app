# coding: utf-8

@prefectures = [
  { :name => '北海道', :position => 1 },
  { :name => '青森県', :position => 2 },
  { :name => '岩手県', :position => 3 },
  { :name => '宮城県', :position => 4 },
  { :name => '秋田県', :position => 5 },
  { :name => '山形県', :position => 6 },
  { :name => '福島県', :position => 7 },
  { :name => '茨城県', :position => 8 },
  { :name => '栃木県', :position => 9 },
  { :name => '群馬県', :position => 10 },
  { :name => '埼玉県', :position => 11 },
  { :name => '千葉県', :position => 12 },
  { :name => '東京都', :position => 13 },
  { :name => '神奈川県', :position => 14 },
  { :name => '新潟県', :position => 15 },
  { :name => '富山県', :position => 16 },
  { :name => '石川県', :position => 17 },
  { :name => '福井県', :position => 18 },
  { :name => '山梨県', :position => 19 },
  { :name => '長野県', :position => 20 },
  { :name => '岐阜県', :position => 21 },
  { :name => '静岡県', :position => 22 },
  { :name => '愛知県', :position => 23 },
  { :name => '三重県', :position => 24 },
  { :name => '滋賀県', :position => 25 },
  { :name => '京都府', :position => 26 },
  { :name => '大阪府', :position => 27 },
  { :name => '兵庫県', :position => 28 },
  { :name => '奈良県', :position => 29 },
  { :name => '和歌山県', :position => 30 },
  { :name => '鳥取県', :position => 31 },
  { :name => '島根県', :position => 32 },
  { :name => '岡山県', :position => 33 },
  { :name => '広島県', :position => 34 },
  { :name => '山口県', :position => 35 },
  { :name => '徳島県', :position => 36 },
  { :name => '香川県', :position => 37 },
  { :name => '愛媛県', :position => 38 },
  { :name => '高知県', :position => 39 },
  { :name => '福岡県', :position => 40 },
  { :name => '佐賀県', :position => 41 },
  { :name => '長崎県', :position => 42 },
  { :name => '熊本県', :position => 43 },
  { :name => '大分県', :position => 44 },
  { :name => '宮崎県', :position => 45 },
  { :name => '鹿児島県', :position => 46 },
  { :name => '沖縄県', :position => 47 },
]

Prefecture.transaction do
  @prefectures.each do |pref|
    r = Prefecture.find_or_initialize_by_name(pref[:name])
    unless r.persisted?
      r.position = pref[:position]
      r.save
      puts "Created '#{pref[:name]}' as id=#{r.id}"
    end
  end
end
