--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

with Ada.Finalization;

package Programs is

   type Program is
     new Ada.Finalization.Limited_Controlled
     with null record;
   --  Basic Program type, which is basis for everything that moves.

   procedure Service (The_Program : Program);
   --  Program entry procedure. Not garenteed to ever return.

end Programs;
