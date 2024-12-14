#Dir['/home/dev/weatherman_meerab/lahore_weather/lahore_weather_1997_Apr.txt'].
require 'date'
require 'colorize'
array=ARGV
option=array[0]
year=array[1]
path=array[2]

#TASK1


def weather(path,year)
  file_path=[]
  Dir::each_child(path){|filename| if filename.include? "#{year}"
      file_path.push(filename)
  end}


#part(a)
#Maximum_Temperature of a city

  def max_tmp(path,file_path)
    array1=[]
    array2=[]
    array3=[]
    array4=[]
    array5=[]
    array6=[]

    i=0
    loop do
      if file_path[i].nil?
        break
      end
      filepath="#{path}/"+"#{file_path[i]}"
      lines=IO.readlines(filepath)
      values=lines.drop(2)                  #lines in each file dropped 1st two lines  are not numeric required values
      values.each{ |line| array1=(line.split(","))
        array2.push(array1[1])
        array3.push(array1[0])

        }
      array4=array2.map(&:to_i)
      array5.push(array3[array4.rindex(array4.max)])
      array6.push(array4.max())


   i=i+1
  end
  max_temp=array6.max()
  max_date_index=array6.rindex(array6.max)
  date_converted=DateTime.parse(array5[max_date_index])
  day= date_converted.strftime( "%B %d")


  puts "Highest: #{max_temp}C on #{day}"
  end





#part(b)
#Lowest Temperature of a city



def min_tmp(path,file_path)
  arr1=[]
  arr2=[]
  arr3=[]
  arr4=[]
  arr5=[]
  arr6=[]

  i=0
  loop do
    if file_path[i].nil?
      break
    end
    path1="#{path}/"+"#{file_path[i]}"
    lines=IO.readlines(path1)
    values=lines.drop(2)                             #lines in each file dropped 1st two lines  are not numeric required values
    values.each{ |line| arr1=(line.split(","))
      arr2.push(arr1[3])
      arr3.push(arr1[0])

      }
    arr4=arr2.map(&:to_i)
    arr5.push(arr3[arr4.rindex(arr4.max)])
    arr6.push(arr4.max())


 i=i+1
end
min_temp=arr6.max()
min_date_index=arr6.rindex(arr6.max)
date_converted=DateTime.parse(arr5[min_date_index])
day= date_converted.strftime( "%B %d")


puts "Lowest: #{min_temp}C on #{day}"
end




#part(c)
#MAximum Humidity of a city



def humid(path,file_path)
  arr_1=[]
  arr_2=[]
  arr_3=[]
  arr_4=[]
  arr_5=[]
  arr_6=[]

  i=0
  loop do
    if file_path[i].nil?
      break
    end
    filepath="#{path}/"+"#{file_path[i]}"
    lines=IO.readlines(filepath)
    values=lines.drop(2)                  #lines in each file dropped 1st two lines  are not numeric required values
    values.each{ |line| arr_1=(line.split(","))
      arr_2.push(arr_1[7])
      arr_3.push(arr_1[0])

      }
    arr_4=arr_2.map(&:to_i)
    arr_5.push(arr_3[arr_4.rindex(arr_4.max)])
    arr_6.push(arr_4.max())


 i=i+1
end
humidity=arr_6.max()
humid_date_index=arr_6.rindex(arr_6.max)
date_converted=DateTime.parse(arr_5[humid_date_index])
day= date_converted.strftime( "%B %d")


puts "Humid: #{humidity}% on #{day}"
end

max_tmp(path,file_path)
min_tmp(path,file_path)
humid(path,file_path)

end

#TASK2
def avg(path,year)
  arr1_=[]
  arr2_=[]
  arr3_=[]
  arr4_=[]
  arr5_=[]

    lines=IO.readlines(path)
    values=lines.drop(2)                  #lines in each file dropped 1st two lines  are not numeric required values
    values.each{ |line| arr1_=(line.split(","))
      arr2_.push(arr1_[2])
      arr3_.push(arr1_[8])
    }
    arr4_=arr2_.map(&:to_i)
    arr5_=arr3_.map(&:to_i)
    max=arr4_.max()
    min=arr4_.min()
    sum=0
    i=0
    loop do
      if arr5_[i].nil?
        break
      end
      sum=sum+arr5_[i]
      i=i+1
    end

    num=arr5_.length
    hum=sum.div(num)


    puts "Highest Average: #{max}C"
    puts "Lowest Average: #{max}C"
    puts "Average Humidity: #{hum}%"
end







#TASK3
def colored(path,year)
  a1=[]
  a2=[]
  a3=[]
  a4=[]
  a5=[]
  a6=[]
  lines=IO.readlines(path)
  values=lines.drop(2)                  #lines in each file dropped 1st two lines  are not numeric required values
  values.each{ |line| a1=(line.split(","))
    a2.push(a1[1])
    a3.push(a1[3])
    a6.push(a1[0])
  }
  a4=a2.map(&:to_i)
  a5=a3.map(&:to_i)

  date_converted=DateTime.parse(a6[0])
  date= date_converted.strftime( "%B %Y")
  puts "#{date}"
  i=0

   loop do
    if a2[i].nil? && a3[i].nil?
      break
    end
    date_converted=DateTime.parse(a6[i])
    day= date_converted.strftime( "%d")
    print "#{day} ","+".red*a4[i],"#{a4[i]}C"
    puts "\n"
    print "#{day} ","+".blue*a5[i],"#{a5[i]}C"
    puts "\n"
    i=i+1
   end

end





#BONUS TASK
def bonus(path,year)
  a1=[]
  a2=[]
  a3=[]
  a4=[]
  a5=[]
  a6=[]
  lines=IO.readlines(path)
  values=lines.drop(2)                  #lines in each file dropped 1st two lines  are not numeric required values
  values.each{ |line| a1=(line.split(","))
    a2.push(a1[1])
    a3.push(a1[3])
    a6.push(a1[0])
  }
  a4=a2.map(&:to_i)
  a5=a3.map(&:to_i)

  date_converted=DateTime.parse(a6[0])
  date= date_converted.strftime( "%B %Y")
  puts "#{date}"
  i=0

   loop do
    if a2[i].nil? && a3[i].nil?
      break
    end
    date_converted=DateTime.parse(a6[i])
    day= date_converted.strftime( "%d")
    print "#{day} ","+".blue*a5[i],"+".red*a4[i]," #{a5[i]}C-#{a4[i]}C"
    puts "\n"
    i=i+1
   end

end



case option
when "-e"                 #for task1  ruby weatherman.rb -e 2002 /home/dev/weatherman_meerab/lahore_weather
  weather(path,year)
when "-a"                 #for task2  ruby weatherman.rb -a 2002/6 /home/dev/weatherman_meerab/lahore_weather/lahore_weather_1997_Apr.txt
  avg(path,year)
when "-c"                 #for task3  ruby weatherman.rb -c 2002/6 /home/dev/weatherman_meerab/lahore_weather/lahore_weather_1997_Apr.txt
  colored(path,year)
when "-b"                 #for bonus task  ruby weatherman.rb -b 2002/3 /home/dev/weatherman_meerab/lahore_weather/lahore_weather_1997_Apr.txt
  bonus(path,year)
end
