---- MODULE MC ----
EXTENDS recycler, TLC

\* Constant expression definition @modelExpressionEval
const_expr_155704897216245000 == 
items \in [type: {"trash", "recycle"}, size: 1..6] \X [type: {"trash", "recycle"}, size: 1..6]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155704897216245000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_155704897216246000 ==
FALSE/\capacity = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_155704897216247000 ==
FALSE/\capacity' = capacity
----
=============================================================================
\* Modification History
\* Created Sun May 05 12:36:12 MSK 2019 by mike
