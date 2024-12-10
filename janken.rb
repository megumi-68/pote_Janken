def janken
  puts "じゃんけんをしましょう！"
  puts "0: グー、1: チョキ、2: パー、3: 戦わない"
  
  user_choice = gets.chomp.to_i
  until [0, 1, 2, 3].include?(user_choice)
    puts "0, 1, 2, 3のいずれかを選んでください。"
    user_choice = gets.chomp.to_i
  end

  if user_choice == 3
    return "終了"
  end

  computer_choice = rand(0..2)

  choices = ["グー", "チョキ", "パー"]

  puts "あなた:#{choices[user_choice]}"
  puts "相手:#{choices[computer_choice]}"

  if user_choice == computer_choice
    puts "引き分けです！"
    return "引き分け"
  elsif (user_choice == 0 && computer_choice == 1) || 
        (user_choice == 1 && computer_choice == 2) ||
        (user_choice == 2 && computer_choice == 0)
    puts "あなたの勝ちです！"
    return "勝ち"
  else
    puts "あなたの負けです！"
    return "負け"
  end
end

def choose_direction()
  puts "方向を選んでください！"
  puts "0: 上、1: 下、2: 左、3: 右"
  choice = gets.chomp.to_i

  until [0, 1, 2, 3].include?(choice)
    puts "無効な選択です。0～3の数字を選んでください。"
    choice = gets.chomp.to_i
  end

  directions = ["上", "下", "左", "右"]
  directions[choice]
end


def acchi_muite_hoi(result)
  puts "あっち向いてホイ！"

  user_direction = choose_direction()

  computer_direction = ["上", "下", "左", "右"].sample
  puts "コンピュータは#{computer_direction}を選びました。"

  if user_direction == computer_direction && result == "勝ち"
    puts "おめでとう！あなたの勝ちです！"
    return true
  elsif user_direction == computer_direction && result == "負け"
    puts "残念！相手の勝ちです！"
    return true
  else
    puts "方向が違います。"
    return false
  end
end

def main_game
  loop do
    result = janken
    flag = ""
    
    if result == "終了"
      puts "終了します"
      return
    end

    if result == "引き分け"
      puts "もう一度じゃんけん！"
      next
    end
    
    while true
      if acchi_muite_hoi(result)
        break
      else
        puts "もう一度じゃんけん！"
        flag = "最初から"
        break
      end
    end

    if flag == "最初から"
      next
    end

    break
  end
end

main_game
