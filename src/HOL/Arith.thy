(*  Title:      HOL/Arith.thy
    ID:         $Id$
    Author:     Lawrence C Paulson, Cambridge University Computer Laboratory
    Copyright   1993  University of Cambridge

Arithmetic operators and their definitions
*)

Arith = Nat +

instance
  nat :: {plus, minus, times}

consts
  pred      :: nat => nat
  div, mod  :: [nat, nat] => nat  (infixl 70)

defs
  pred_def  "pred(m) == case m of 0 => 0 | Suc n => n"

  mod_def   "m mod n == wfrec (trancl pred_nat)
                          (%f j. if j<n then j else f (j-n)) m"
  div_def   "m div n == wfrec (trancl pred_nat) 
                          (%f j. if j<n then 0 else Suc (f (j-n))) m"


primrec "op +" nat 
"0 + n = n"
"Suc m + n = Suc(m + n)"


primrec "op -" nat 
"m - 0 = m"
"m - Suc n = pred(m - n)"

primrec "op *"  nat 
"0 * n = 0"
"Suc m * n = n + (m * n)"


end

(*"Difference" is subtraction of natural numbers.
  There are no negative numbers; we have
     m - n = 0  iff  m<=n   and     m - n = Suc(k) iff m)n.
  Also, nat_rec(0, %z w.z, m) is pred(m).   *)

