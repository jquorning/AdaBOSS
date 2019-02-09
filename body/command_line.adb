--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

with Ada.Text_IO;

with GNAT.Command_Line;

with Setup;
with Options;

package body Command_Line is

   procedure Getopt_Callback
     (Switch  : String;  Param : String;  Section : String);
   --  To be installed and called by Getopt on command line switch encounter.

   Long_Switch_Show_Help     : constant String := "--help";
   Long_Switch_Show_Version  : constant String := "--version";

   use GNAT.Command_Line;
   Config : Command_Line_Configuration;

   procedure Getopt_Callback (Switch, Param, Section : String) is
      pragma Unreferenced (Section);

   begin
      null;
   end Getopt_Callback;


   procedure Process_Command_Line (Result : out Process_Result) is
   begin
      Define_Switch (Config, Options.Show_Help'Access, "-h",
                     Help => "Show this help text.",
                     Long_Switch => Long_Switch_Show_Help);
      Define_Switch (Config, Options.Show_Version'Access, "-v",
                     Help        => "Show program name and version.",
                     Long_Switch => Long_Switch_Show_Version);

      --  Do the whole parsing business.
      --  Actually just the -D= option and file name.
      Getopt (Config, Getopt_Callback'Access);

      if Options.Show_Help then
         Result := Bailout;

      elsif Options.Show_Version then
         declare
            use Ada.Text_IO, Setup;
            Version : constant String :=
              Get_Program_Name & " (" &
              Get_Program_Version & ") Build (" &
              Get_Build_ISO8601_UTC & ")";
         begin
            Put_Line (Version);
            New_Line;
            Put_Line ("The author disclaims copyright to this source code.  In place of");
            Put_Line ("a legal notice, here is a blessing:");
            New_Line;
            Put_Line ("   May you do good and not evil.");
            Put_Line ("   May you find forgiveness for yourself and forgive others.");
            Put_Line ("   May you share freely, not taking more than you give.");
            New_Line;
         end;
         Result := Bailout;

      else
         Result := Success;
      end if;

   exception

      when Invalid_Switch =>
         Ada.Text_IO.Put_Line ("INVALID_SWITCH");

      when Invalid_Parameter =>
         Ada.Text_IO.Put_Line ("INVALID_PARAMETER");
         Result := Failure;

      when Exit_From_Command_Line =>
         Ada.Text_IO.Put_Line ("EXIT_FROM_COMMAND_LINE");
         Result := Bailout;

   end Process_Command_Line;


end Command_Line;
