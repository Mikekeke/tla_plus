---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_155704571548324000 == 
2 + 2
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155704571548324000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155704571548325000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155704571548326000 ==
NoOverdrafts
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_155704571548327000 ==
EventuallyConsistent
----
=============================================================================
\* Modification History
\* Created Sun May 05 11:41:55 MSK 2019 by mike
