--
--  The author disclaims copyright to this source code.  In place of
--  a legal notice, here is a blessing:
--
--    May you do good and not evil.
--    May you find forgiveness for yourself and forgive others.
--    May you share freely, not taking more than you give.
--

package Mediators.Security is

   type Key_Kind is
     (None,       --  Full trust
      Magic,      --  Trust by magic number
      Certificate --  Severe mistrust
     );

   type Magic_Number_Type is new Long_Integer;

   type Key_Type (Kind : Key_Kind) is
      record
         case Kind is
            when None =>
               null;
            when Magic =>
               Magic_Number : Magic_Number_Type;
            when Certificate =>
               Cert : Integer;  --  Placeholder XXX
         end case;
      end record;
   type Key_Access is access all Key_Type;

   type Security_Mediator is
     new Mediator with
      record
         Key : Key_Access;
      end record;

end Mediators.Security;
