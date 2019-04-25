---- MODULE MC ----
EXTENDS TCommit, TLC

\* CONSTANT definitions @modelParameterConstants:0RM
const_15562043745756000 == 
{"r1", "r2", "r3"}
----

\* INIT definition @modelBehaviorInit:0
init_15562043745757000 ==
TCInit
----
\* NEXT definition @modelBehaviorNext:0
next_15562043745758000 ==
TCNext
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15562043745759000 ==
TCTypeOK
----
=============================================================================
\* Modification History
\* Created Thu Apr 25 17:59:34 MSK 2019 by mike
