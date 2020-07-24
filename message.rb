module Message
  
  module_function

  # スタートメッセージ
  def start_message
    puts <<~TEXT
    ######  都道府県クイズ　スタート！！  ######
    クイズのモードは、２つあるよ。
    1 : 都道府県名から県庁所在地を答える
    2 : 県庁所在地から県名を答える
    ####################################
    TEXT
  end

  # クイズモードメッセージ
  def mode_promt_message
    print "クイズのモードを選んで、入力してね。(1 or 2): "
  end

  # クイズ数モメッセージ
  def count_promt_message
    puts <<~TEXT

    クイズの数は１〜４７問の間で選べるよ！

    TEXT
    print "こたえるクイズ数を、入力してね。(1 〜 47): "
  end


  # エラーメッセージ
  def error_message
    puts <<~EOS

  
        入力内容に誤りがあります。


        選択肢から選んでね。

        
    EOS
  end

  # 結果メッセージ
  def result_message(all, correct)
    puts <<~EOS
        ######  都道府県クイズ　終了です！！  ######
        おつかれさまでした。
        結果は、
        ・
        ・
        ・
    EOS
    puts "全 #{all} 問中、 #{correct} 問、正解でした！"
    puts "####################################"
  end
end
