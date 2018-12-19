
/*Problem statement: 
find random 9 digit number, which are divisible by 2, 3, 4, ... 11.  

No for loop, only using constraints.  */


//Solution Linkhttps://www.edaplayground.com/x/5T2N


class inline; 
  rand int arr[9:0];
  constraint cons1 {foreach(arr[i]) arr[i] >= 0;}
  constraint cons2 {foreach(arr[i]) arr[i] <= 9;}
  constraint cons3{arr[0] > 0;} 
  constraint cons4{arr[8] < 1;} //Last disit 0 Divided by 10,5,2
  constraint cons5{arr.sum() %9 == 0;} // Divided by 9 & 3 
// // Divided by 6 if the value is divided by 2 & 3
  constraint cons6{ (2*arr[0]+3*arr[1]+1*arr[2]-2*arr[3]-3*arr[4]-1*arr[5]+2*arr[6]+3*arr[7])%7==0;} // Divided by 7
  constraint cons7{(arr[7]+arr[6])%8==0;} // Divided by 8
  constraint cons8{(arr[0]-arr[1]+arr[2]-arr[3]+arr[4]-arr[5]+arr[6]-arr[7])%11 ==0;} // Divided by 11
endclass   

program checker1; 
inline obj; 
initial 
begin 
obj = new(); 
 
  repeat(500) 
  
     if( obj.randomize())  
     begin
       for(int j=0;j<9;j++) begin
         $write("%0d",obj.arr[j]);
       end
       $write("\n");
 
     end
       
        else 
        $display(" Randomization fails"); 
  	
      end   

endprogram