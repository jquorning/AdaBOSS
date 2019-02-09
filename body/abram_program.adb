--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

with Ada.Text_IO;
with Ada.Command_Line;

with Command_Line;

procedure Abram_Program is

   use Ada.Command_Line;
   use Command_Line;
   Status : Process_Result;

begin
   Process_Command_Line (Status);

   case Status is

      when Command_Line.Success  =>
         Set_Exit_Status (Ada.Command_Line.Success);

      when Command_Line.Failure  =>
         Set_Exit_Status (Ada.Command_Line.Failure);
         return;

      when Command_Line.Bailout  =>
         Set_Exit_Status (Ada.Command_Line.Success);
         return;

   end case;

   Ada.Text_IO.Put_Line ("Abram says: ""Hello, World!"".");

end Abram_Program;
