
# Opening a file
fileobject = File.open("text.txt", "r"); 
  
# Reading the first n characters from a file
file=fileobject.read()

fileobject.close();

file=file.gsub(' ', "")
size=file.length()
total_rows=0
total_cols=0
puts file
for ammad in 0..size
    if file[ammad]=='I'
        puts 
        array = Array.new(file[ammad+2].to_i) do
            Array.new(file[ammad+1].to_i) do
              "O"
            end
        end
        total_rows=file[ammad+2].to_i
        total_cols=file[ammad+1].to_i

    end
    if file[ammad]=="L"
        col=file[ammad+1].to_i 
        col+=-1
        row=file[ammad+2].to_i
        row+=-1
        array[row][col]=file[ammad+3]
    end
    if file[ammad]=="V"
        col=file[ammad+1].to_i 
        col+=-1
        row1=file[ammad+2].to_i
        row1+=-1
        row2=file[ammad+3].to_i
        row2+=-1
        for i in row1..row2
            array[i][col]=file[ammad+4]
        end
    end
    if file[ammad]=="H"
        col=file[ammad+1].to_i 
        col+=-1
        col1=file[ammad+2].to_i
        col1+=-1
        row=file[ammad+3].to_i
        row+=-1
        for i in col..col1
            array[row][i]=file[ammad+4]
        end
    end
    if file[ammad]=="S"
        for i in (0...array.size)
            for j in (0...array[i].length)
             print "#{array[i][j]}
            end
            puts
           end
    end    
end

