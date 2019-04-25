---- MODULE MC ----
EXTENDS TCommit, TLC

\* CONSTANT definitions @modelParameterConstants:0RM
const_155620452221915000 == 
{"r1", "r2", "r3"}
----

\* INIT definition @modelBehaviorInit:0
init_155620452221916000 ==
TCInit
----
\* NEXT definition @modelBehaviorNext:0
next_155620452221917000 ==
TCNext
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155620452221918000 ==
TCTypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155620452221919000 ==
TCConsistent
----
=============================================================================
\* Modification History
\* Created Thu Apr 25 18:02:02 MSK 2019 by mike
