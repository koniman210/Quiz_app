require './message'
require './prefecture'

class  Quiz
  def initialize(mode,count,data)
    @mode = mode
    @count = count
    @data = data
  end
  def create_quiz_order
    @quiz_order = (0..46).to_a.shuffle.slice(0..@count-1)
  end
  
  def question
    puts "----------------"
    num_correct = 0
    num = 1
    case @mode
    when 1 
      @quiz_order.each do |quiz|
        print "問題#{num}:【#{@data[quiz][:pref]}】の県庁所在地は？"
        answer = gets.chomp
        if answer === @data[quiz][:capital]
          puts "正解！"
          num_correct += 1
        else
          puts "違います"
        end
        puts "--------------------"
        num += 1
      end
      return num_correct
    when 2
      @quiz_order.each do |quiz|
        print "問題 #{num}:【#{@data[quiz][:capital]}】がある都道府県は？"
        answer = gets.chomp
        if answer === @data[quiz][:pref]
          puts "正解！"
          num_correct += 1
        else
          puts "違います"
        end
        puts "--------------------"
        num += 1
      end
      return num_correct 
    else
      #
    end
  end
end
Message.start_message
while true
  Message.mode_promt_message
  quiz_mode = gets.chomp.to_i

  if quiz_mode<1 || quiz_mode>2
    Message.error_message
    next
  end
  if quiz_mode = 1
    puts "--------------------"
    puts "都道府県名から県庁所在地を答えるを選択しました"
    puts "--------------------"
  else
    puts "--------------------"
    puts "県庁所在地から県名を答えるを選択しました"
    puts "--------------------"
  end
  break
end
while true
  Message.count_promt_message
  quiz_count = gets.chomp.to_i

  if quiz_count<1 || quiz_count>47
    Message.error_message
    next
  end
  puts "--------------------"
  puts "では#{quiz_count}問出題します！"
  puts "--------------------"
  break
end

quiz = Quiz.new(quiz_mode,quiz_count,pref_data)
quiz.create_quiz_order
correct_count = quiz.question
Message.result_message(quiz_count, correct_count)
