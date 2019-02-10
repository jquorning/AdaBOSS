--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

package Programs.Workers is

   type Worker is new Program with null record;
   --  Basic Program type, which is basis for everything that moves.

   overriding
   procedure Service (The_Program : Worker);
   --  Program entry procedure. Not garenteed to ever return.

end Programs.Workers;
