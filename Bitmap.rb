class Bitmap
    attr_accessor :column, :row, :array, :file, :size

    def read_file()
        # Opening a file
        begin
        fileobject = File.open("text.txt", "r"); 
        # Reading the first n characters from a file
        rescue Errno::ENOENT  => e
            puts "Caught the exception: #{e}"
            exit -1
        else
            file=fileobject.read()
            fileobject.close();
            @file=file.gsub(' ', "")
            @size=file.length()
            puts @file

        end
        
    end
    def create_Bitmap(column,row)
        @column,@row=column,row
        puts column
        puts row
        @array=Array.new(row) do
            Array.new(column) do
              "O"
            end
        end       
    end
    def clear()
        for i in (0...array.length)
            for j in (0...array[i].length)
             array[i][j]="O"
            end
            puts
           end
    end

    def horizontal(index)
        col=@file[index+1].to_i 
        col+=-1
        col1=@file[index+2].to_i
        col1+=-1
        row=@file[index+3].to_i
        row+=-1
        puts row
        
        for i in col..col1
            @array[row][i]=@file[index+4]
        end
    end

    def vertical(index)
        col=@file[index+1].to_i 
        col+=-1

        row1=@file[index+2].to_i
        row1+=-1
        row2=@file[index+3].to_i
        row2+=-1
       
        for i in row1..row2
            @array[i][col]=@file[index+4]
        end
    end


    def show()
        for i in (0...array.length)
            for j in (0...array[i].length)
             print "#{array[i][j]} "
            end
            puts
           end
    end

    def check()

        for index in 0..@size
            x=@file[index]
            case x
            when 'I'
                total_rows=file[index+2].to_i
                total_cols=file[index+1].to_i
                create_Bitmap(total_cols,total_rows)
            when 'H'
                horizontal(index)
            when 'V'
               vertical(index)
            when "L"
                col=file[index+1].to_i 
                 col+=-1
                 row=file[index+2].to_i
                row+=-1
                @array[row][col]=file[index+3]
            when "C"
                clear()
            when "S"
                show()
            end


        end
    end
    def error_validation()
        total_rows=0
        total_cols=0
        flag=true
        flag1=true
        for index in 0..@size
            case @file[index]
            when 'I'
                if flag==false
                    
                    puts "Bitmap is Already initialized"
                    flag1=false
                    break;

                end
                if '0'<=file[index+2] && file[index+2]<='9'
                    puts 
                else
                    flag1=false
                    puts "Value of initilizers not correct"
                end
                if '0'<=file[index+1] && file[index+1]<='9'
                    puts 
                else
                    flag1=false
                    puts "Value of initilizers not correct"
                end

                total_rows=file[index+2].to_i
                total_cols=file[index+1].to_i
                if total_rows>255 || total_cols>255
                    puts "Range out of box"
                end

                flag=false
            
            when 'H'
                col=@file[index+1].to_i 
                col+=-1
                col1=@file[index+2].to_i
                col1+=-1
                row=@file[index+3].to_i
                row+=-1
                puts row
                if flag==true
                    puts "Array is not initialized yet"
                    breaks

                end

                if row> total_rows
                    flag1=false
                    puts "Horizontal Ranges not valid"
                    break;
                end
                if  col1>total_cols
                    flag1=false
                    puts "Horizontal Ranges not valid"
                    break;
                end
                if  col>col1
                    flag1=false
                    puts "Horizontal Ranges not valid"
                    break;
                end
            end
            if @file[index]=='V'
                if flag==true
                    puts "Array is not initialized yet"
                    flag1=false
                    break
                end
                col=@file[index+1].to_i 
                col+=-1
        
                row1=@file[index+2].to_i
                row1+=-1
                row2=@file[index+3].to_i
                row2+=-1
                if col> total_cols
                    flag1=false
                    puts "Vertical Ranges not valid"
                    break;
                end
                if  row1>total_rows
                    flag1=false
                    puts "Vertical Ranges not valid"
                    break;
                end
                if  row1>row2
                    flag1=false
                    puts "Vertical Ranges not valid"
                    break;
                end
            end
            if @file[index]=="L"
                col=file[index+1].to_i 
                col+=-1
                row=file[index+2].to_i
                row+=-1
                if row>total_rows || col>total_cols
                    flag1=false
                    puts "Index Out of Bound"
                end
            
            end
        end
        if flag1
            check()
        end
    end
   
end

bit = Bitmap.new()

bit.read_file()

bit.error_validation()
