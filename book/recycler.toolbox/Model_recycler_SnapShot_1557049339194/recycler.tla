----MODULE recycler----
EXTENDS Sequences, Integers, TLC, FiniteSets
(*--algorithm recycler
variables
\*    capacity = [trash |-> 10, recycle |-> 10],
    capacity \in [trash: 1..10, recycle: 1..10],    
    bins = [trash |-> {}, recycle |-> {}],
    count = [trash |-> 0, recycle |-> 0],
\*    items = <<
\*        [type |-> "recycle", size |-> 5],
\*        [type |-> "trash", size |-> 5],
\*        [type |-> "recycle", size |-> 4],
\*        [type |-> "recycle", size |-> 3]
\*    >>,
    item = [type: {"trash", "recycle"}, size: 1..6],
    items \in item \X item \X item \X item,
    curr = ""; \* helper: current item

macro add_item(type) begin
  bins[type] := bins[curr.type] \union {curr};
  capacity[type] := capacity[type] - curr.size;
  count[type] := count[type] + 1;
end macro;
    
begin
    while items /= <<>> do
        curr := Head(items);
        items := Tail(items);
        if curr.type = "recycle" /\ curr.size < capacity.recycle then
            add_item("recycle");
        elsif curr.size < capacity.trash then
            add_item("recycle");
        end if;
     end while;
     assert capacity.trash >= 0 /\ capacity.recycle >= 0;
     assert Cardinality(bins.trash) = count.trash;
     assert Cardinality(bins.recycle) = count.recycle;
end algorithm; *)
\* BEGIN TRANSLATION
VARIABLES capacity, bins, count, item, items, curr, pc

vars == << capacity, bins, count, item, items, curr, pc >>

Init == (* Global variables *)
        /\ capacity \in [trash: 1..10, recycle: 1..10]
        /\ bins = [trash |-> {}, recycle |-> {}]
        /\ count = [trash |-> 0, recycle |-> 0]
        /\ item = [type: {"trash", "recycle"}, size: 1..6]
        /\ items \in item \X item \X item \X item
        /\ curr = ""
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF items /= <<>>
               THEN /\ curr' = Head(items)
                    /\ items' = Tail(items)
                    /\ IF curr'.type = "recycle" /\ curr'.size < capacity.recycle
                          THEN /\ bins' = [bins EXCEPT !["recycle"] = bins[curr'.type] \union {curr'}]
                               /\ capacity' = [capacity EXCEPT !["recycle"] = capacity["recycle"] - curr'.size]
                               /\ count' = [count EXCEPT !["recycle"] = count["recycle"] + 1]
                          ELSE /\ IF curr'.size < capacity.trash
                                     THEN /\ bins' = [bins EXCEPT !["recycle"] = bins[curr'.type] \union {curr'}]
                                          /\ capacity' = [capacity EXCEPT !["recycle"] = capacity["recycle"] - curr'.size]
                                          /\ count' = [count EXCEPT !["recycle"] = count["recycle"] + 1]
                                     ELSE /\ TRUE
                                          /\ UNCHANGED << capacity, bins, 
                                                          count >>
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert(capacity.trash >= 0 /\ capacity.recycle >= 0, 
                              "Failure of assertion at line 35, column 6.")
                    /\ Assert(Cardinality(bins.trash) = count.trash, 
                              "Failure of assertion at line 36, column 6.")
                    /\ Assert(Cardinality(bins.recycle) = count.recycle, 
                              "Failure of assertion at line 37, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << capacity, bins, count, items, curr >>
         /\ item' = item

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

====
