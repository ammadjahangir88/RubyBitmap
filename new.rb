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
            @file=file
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
        row=""
        col=""
        col1=""

        index=index+1
        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            col+=file[index]
            index+=1
        end

        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            col1+=file[index]
            index+=1
        end
        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            row+=file[index]
            index+=1
        end
        col=col.to_i
        col1=col1.to_i
        row=row.to_i
        puts col
        puts col1
        puts row
        col+=-1
        col1+=-1
        row+=-1
        while file[index]==" "
            index+=1
        end
        for i in col..col1
            @array[row][i]=@file[index]
        end
    end

    def vertical(index)
        col=""
        row1=""
        row2=""
        index=index+1
        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            col+=file[index]
            index+=1
        end

        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            row1+=file[index]
            index+=1
        end
        while file[index]==" "
            index+=1
        end
        while file[index] !=" "
            row2+=file[index]
            index+=1
        end
        col=col.to_i
        row1=row1.to_i
        row2=row2.to_i
        col+=-1
        row1+=-1
        row2+=-1

        while file[index]==" "
            index+=1
        end

       
        for i in row1..row2
            @array[i][col]=@file[index]
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
                total_cols=""
                total_rows=""
                index=index+1
                while file[index]==" "
                index+=1
                end
                while file[index] !=" "
                    total_cols+=file[index]
                    index+=1
                end

                while file[index]==" "
                    index+=1
                    end
                while file[index] !=" "
                    total_rows+=file[index]
                    index+=1
                end
                total_rows=total_rows.to_i
                total_cols=total_cols.to_i
                create_Bitmap(total_cols,total_rows)

            when 'H'
                horizontal(index)
            when 'V'
                vertical(index)

            when 'L'
                rows=""
                cols=""
                index+=1
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    cols+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    rows+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                rows=rows.to_i
                cols=cols.to_i

                rows+=-1
                cols+=-1

                @array[rows][cols]=file[index]




            when 'S'
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
                if !flag
                    puts "Bitmap is Already initialized"
                    flag1=false
                    break;
                end
                index+=1
                while file[index]==" "
                    index+=1
                end
                total_cols=""
                while flag1
                    if file[index]==" "
                        break
                    elsif '0'<=file[index] && file[index]<='9'
                        puts total_cols
                        total_cols+=file[index]
                        puts 
                    else
                        flag1=false
                        puts "Value of initilizers not correct"
                    end
                index=index+1
                end
                while file[index]==" "
                    index+=1
                end
                total_rows=""
                while flag1
                    if file[index]==" "
                        break
                    end
                    if '0'<=file[index] && file[index]<='9'
                        total_rows+=file[index]
                        puts 
                    else
                        flag1=false
                        puts "Value of initilizers not correct"
                    end
                    index=index+1
                end
                

                puts total_rows
                puts total_cols
                total_rows=total_rows.to_i
                total_cols=total_cols.to_i
                if total_rows>255 || total_cols>255
                    flag1=false
                    puts "Range out of box"
                end

                flag=false
            when 'H'
                if flag==true
                    puts "Array is not initialized yet"
                    breaks
                end
                
                row=""
                col=""
                col1=""
        
                index=index+1
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    col+=file[index]
                    index+=1
                end
        
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    col1+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    row+=file[index]
                    index+=1
                end
                col=col.to_i
                col1=col1.to_i
                row=row.to_i
                puts col
                puts col1
                puts row
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

            when "V"
                if flag==true
                    puts "Array is not initialized yet"
                    flag1=false
                    break
                end
                col=""
                row1=""
                row2=""
                index=index+1
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    col+=file[index]
                    index+=1
                end
        
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    row1+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    row2+=file[index]
                    index+=1
                end
                col=col.to_i
                row1=row1.to_i
                row2=row2.to_i
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
            when 'L'
                rows=""
                cols=""
                index+=1
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    cols+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                while file[index] !=" "
                    rows+=file[index]
                    index+=1
                end
                while file[index]==" "
                    index+=1
                end
                rows=rows.to_i
                cols=cols.to_i

                if cols> total_cols
                    flag1=false
                    puts "L Ranges not valid"
                    break;
                end
                if  rows>total_rows
                    flag1=false
                    puts "L Ranges not valid"
                    break;
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