-- two_tasks.adb
with Ada.Text_Io; use Ada.Text_Io;

procedure Two_Tasks is
	
	T1 : constant := 1.1;
	T2 : constant := 2.67;
	
	task Thread1;
	task Thread2;
	
	task body Thread1 is
	begin
		loop
			Put_Line("Thread1");
			delay T1;
		end loop;
	end Thread1;
	
	task body Thread2 is
	begin
		loop
			Put_Line("Thread2");
			delay T2;
		end loop;
	end Thread2;
	
	begin
	null;
end Two_Tasks;