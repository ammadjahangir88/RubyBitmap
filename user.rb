
# Opening a file
fileobject = File.open("text.txt", "r"); 
  
# Reading the first n characters from a file
file=fileobject.read()

fileobject.close();


size=file.length()
total_rows=0
total_cols=0
puts file
prev_state=''
for index in 0..size
    if file[index]=='I'
        prev_state="I"
        array = Array.new(file[index+2].to_i) do
            Array.new(file[index+1].to_i) do
              "O"
            end
        end
        total_rows=file[index+2].to_i
        total_cols=file[index+1].to_i

    end
    if  prev_state="I" && file[index]!=' '
        while '0'<=file[index+2] && file[index+2]<='9'
            
        end

    end
    if file[index]=="L"
        col=file[index+1].to_i 
        col+=-1
        row=file[index+2].to_i
        row+=-1
        array[row][col]=file[index+3]
    end
    if file[index]=="V"
        col=file[index+1].to_i 
        col+=-1
        row1=file[index+2].to_i
        row1+=-1
        row2=file[index+3].to_i
        row2+=-1
        for i in row1..row2
            array[i][col]=file[index+4]
        end
    end
    if file[index]=="H"
        col=file[index+1].to_i 
        col+=-1
        col1=file[index+2].to_i
        col1+=-1
        row=file[index+3].to_i
        row+=-1
        for i in col..col1
            array[row][i]=file[index+4]
        end
    end
    if file[index]=="S"
        array.each_with_index do |sub_array, i|
            array.each_with_index do |item, j|
              print "#{array[i][j]} "
            end
            puts
        end
    end    
end

