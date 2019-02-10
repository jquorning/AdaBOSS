--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

--  with Ada.Finalization;

with Messages;
with Subprograms;

package Programs is

   type Program is
     tagged limited -- new Ada.Finalization.Limited_Controlled
     null record;
   --  Basic Program type, which is basis for everything that moves.

   procedure Service (The_Program : Program);
   --  Program entry procedure. Not garenteed to ever return.

--   procedure Pass_Message (The_Program : Program;
--                           The_Message : Messages.Message);
   --  Pass The_Message to The_Progam asyncronously

--   procedure Call
--     (The_Program   : Program;
--      The_Procedure : Subprograms.Subprogram)
--      is abstract;
   --  Call The_Procedure to The_Progam asyncronously.

--   procedure Call_Syncronously
--     (From          : Program;
--      The_Program   : Program;
--      The_Procedure : Subprograms.Subprogram)
--      is abstract;
   --  Call The_Procedure in The_Progam syncronously returning result to From procedure.

end Programs;
