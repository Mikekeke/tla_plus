---- MODULE MC ----
EXTENDS recycler, TLC

\* Constant expression definition @modelExpressionEval
const_expr_155704949432653000 == 
{1,2} \X {4,5}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155704949432653000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_155704949432654000 ==
FALSE/\capacity = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_155704949432655000 ==
FALSE/\capacity' = capacity
----
=============================================================================
\* Modification History
\* Created Sun May 05 12:44:54 MSK 2019 by mike
