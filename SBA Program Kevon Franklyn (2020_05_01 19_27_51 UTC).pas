{Author:Kevon Franklyn
 Date:1/18/17
 Description:The program allows the user to enter data for students and calculating the balances of school fee }
Program StudentInfo;
uses crt;
const
     limit=31;//Max number of records able to be stored



var
   index:integer; 
   Names:array[1..limit] of string;
   id:array[1..limit] of string; 
   ages:array[1..limit] of integer; 
   gender:array[1..limit] of char; 
   gradelevel:array[1..limit] of integer;
   paymentplan:array[1..limit] of char;
   schoolfee:array[1..limit] of integer;
   disint:array[1..limit] of string;
   actualamountpaid:array[1..limit] of integer;
   paymentdue:array[1..limit] of real;
   Bal1:real;
   Bal2:real;
   Bal3:real;

Procedure dataentry; //This procedure will accept student data
begin
     for index:=1 to limit do
          begin
               writeln('Please enter the full name of the student,ex John Cline');
               readln(names[index]);

               repeat    //makes sure the user inputs a valid age for student
                     writeln('Please enter the age of the student between the ages of 11 and 19');
                     readln(ages[index]);
               until(ages[index]<=19) and (ages[index]>=11);

               Repeat    //forces the user to input gender as M for male and F for female
                     writeln('Please enter the gender of the student M for Male or F for Female ');
                     readln(Gender[index]);
               Until (Gender[index] = 'F') or (Gender[index] = 'f') or (Gender[index] = 'M') or (Gender[index] = 'm') ;
               writeln('Please enter the id of the student');
               readln(id[index]);
               Repeat
                    writeln('Enter the grade level of the student. 1 for Lower School, 2 for Upper School or 3 for Sixth Form');
                    readln(gradelevel[index]);
               Until (gradelevel[index]=1) or (gradelevel[index]=2) or (gradelevel[index]=3);
               if (gradelevel[index]=1) then
                              (schoolfee[index]) := 350000
               else if (gradelevel[index]=2) then
                         (schoolfee[index]) := 400000
               else
                         (schoolfee[index]) := 550000;
               Repeat 
                    writeln('Please enter the payment plan selected for the student. E for Early-Bird,H for Half Payment or P for Per-Term');
                    readln(paymentplan[index]);
               Until (paymentplan[index]='E') or (paymentplan[index]='e') or (paymentplan[index]='P') or (paymentplan[index]='p') or (paymentplan[index]='H') or (paymentplan[index]='h');
               if (paymentplan[index]='E') or (paymentplan[index]='e') then
                              (disint[index]) := '10% Discount'
               else if (paymentplan[index]='H') or (paymentplan[index]='h') then
                         (disint[index]) := '5% Discount'
               else
                         (disint[index]) := '7.5% Interest';
               if (paymentplan[index]='E') or (paymentplan[index]='e') then
                              (actualamountpaid[index]) := (schoolfee[index])
               else if (paymentplan[index]='H') or (paymentplan[index]='h') then
                         (actualamountpaid[index]) := (schoolfee[index]) div 2
               else
                         (actualamountpaid[index]) := (schoolfee[index]) div 3;
               if (paymentplan[index]='E') or (paymentplan[index]='e') then
                              (paymentdue[index]) := 0
               else if (paymentplan[index]='H') or (paymentplan[index]='h') then
                         (paymentdue[index]) := (schoolfee[index]) * 0.475
               else
                         (paymentdue[index]) := (schoolfee[index]) * 1.075;
               if (gradelevel[index]=1) then
                              (Bal1) := (Bal1) + (paymentdue[index])
               else if (gradelevel[index]=2) then
                         (Bal2) := (Bal2) + (paymentdue[index])
               else
                         (Bal3) := (Bal3) + (paymentdue[index]);
               break;
               clrscr;  //clears screen to declutter user interface
          end;


end;
Procedure showdata; //this procedure will show the current data in the array
begin
     if ages[1]<11 then    //this statement will ensure that data is in the array before it is displayed
     begin
          writeln('No data entered,returning to menu');
          delay(500);
          clrscr;
          exit;
     end;
      writeln('Here are the records of the students on file');
      for index:=1 to limit do
      begin

           writeln('Name:      ',names[index]:20);
           writeln('Age:       ',ages[index]:20);
           writeln('Gender:    ',gender[index]:20);
           writeln('Studentid:  ',id[index]:20);
               if (gradelevel[index]=1) then
                    writeln('Grade Level: Lower School');
               if (gradelevel[index]=2) then
                    writeln('Grade Level: Upper School');
               if (gradelevel[index]=3) then
                    writeln('Grade Level: Sixth Form');
               if (paymentplan[index]='E') or (paymentplan[index]='e') then
                     writeln('Payment Plan: Early-Bird'); 
               if (paymentplan[index]='H') or (paymentplan[index]='h') then
                     writeln('Payment Plan: Half-Payment');
               if (paymentplan[index]='P') or (paymentplan[index]='p') then
                     writeln('Payment Plan: Per-Term');
          writeln('School Fee:    ',schoolfee[index]:20);
          writeln('Discount/Interst:   ',disint[index]:20);
          writeln('Actual Amounnt Paid:   ',actualamountpaid[index]:20);
          writeln();
      end;


end;

Procedure Search; //this procedure will search the array by the studen'ts name and display all data associated with the student
var
     search:string; //the search value given by the user
     found:boolean; //boolean check value that is used if the falue is found or not


Begin
     if ages[1]<11 then 
     begin
          writeln('No values entered,returning to menu');
          delay(500);
          clrscr;
          exit;
     end;
     
     found:=false;
     index:=1;

     writeln('What name would you like to search for ? ');
     readln(search);
     while (index<=limit) and (found=false) do
     begin
          if Names[index]=search then
          begin
               writeln('Value found at ',index);
               writeln('The record is as follows:');
               writeln();
               writeln('Name:     ',names[index]);
               writeln('Age:      ',ages[index]);
               writeln('Gender:   ',gender[index]);
               writeln('StudentID: ',id[index]);
               if (gradelevel[index]=1) then
                    writeln('Grade Level: Lower School');
               if (gradelevel[index]=2) then
                    writeln('Grade Level: Upper School');
               if (gradelevel[index]=3) then
                    writeln('Grade Level: Sixth Form');
               if (paymentplan[index]='E') or (paymentplan[index]='e') then
                     writeln('Payment Plan: Early-Bird'); 
               if (paymentplan[index]='H') or (paymentplan[index]='h') then
                     writeln('Payment Plan: Half-Payment');
               if (paymentplan[index]='P') or (paymentplan[index]='p') then
                     writeln('Payment Plan: Per-Term');
          writeln('School Fee:    ',schoolfee[index]:20);
          writeln('Discount/Interst:   ',disint[index]:20);
           writeln('Actual Amounnt Paid:   ',actualamountpaid[index]:20);
          writeln();
               found:=true;
               writeln('Returning to main menu');   
               delay(5000);
               clrscr;

          end
          else
          begin
                index:=index+1;    
          end;

      end;

      if index>limit then   
      begin
           writeln('Value not found!');
           delay(500);
           clrscr;
      end;
     



end;
Procedure gradelevelbalance;
begin
     writeln('The total balance for Lower School is',Bal1:7:2,',the total balance for Upper School',Bal2:7:2,'and the total balance for Sixth Form is',Bal3:7:2);
     readln;
end;

Procedure menu; 
var
   choice:integer; 
begin
     choice:=0;    
     while choice<>5 do  
     begin

           writeln('Student Registry Menu');
           writeln('1.Add Students');
           writeln('2.Search');
           writeln('3.View Records');
           writeln('4.Balance');
           writeln('5.Exit');
           readln(choice);
           if choice=1 then
           begin
                if index>=limit then  //this checks if the array is full,if it is the user will not be allowed to continue
                begin
                     writeln('School population is at limit');
                     delay(2000);
                     exit;
                 exit;
                 end;
                 clrscr;
                 dataentry;   
           end;
           if choice=2 then
           begin
                search;   
           end;
           if choice=3 then
           begin
                showdata;    
           end;
           if choice=4 then
           begin
               gradelevelbalance;
           end;
           if choice=5 then
           begin
                exit;      
           end;
           if (choice>5) or (choice<1) then 
           begin
                writeln('Invalid choice!');
                delay(500);
                clrscr;
           end;
     end;
end;

begin    

            clrscr;
            menu;



end.
