-- ==
-- entry: firstTraverse traverse
--


let getParent (node_index: i32) = (node_index-1) / 2

let isLeaf (h: i32) (node_index: i32) = node_index >= (1 << (h+1)) - 1

let addToSecond (e: i32) : i32 = if (e & 1) == 1 then 1 else -1


-- This is implemented for 1-dim
-- height: the height of the tree (without leaves)
-- tree: the k-d tree, denoted `split_values` in Fabian's code
-- query: our query (1-dim)
-- knn:    the worse nearest neighbour
-- last_leaf: last visited leaf
-- stack:  array of booleans (which should be represented as an int)
--         which denotes whether the `second child` of a node has
--         been visited already
-- Results: the index of the new leaf and the new stack
--
entry traverse [d][n][l] (height:             i32)  (median_dims:     [n]i32)
                         (median_vals:     [n]f32)  (wknn:               f32)
                         (query:           [d]f32)  (stack:              i32) 
                         (last_leaf:          i32)  (lower_bounds: [l][d]f32)
                         (upper_bounds: [l][d]f32)  : (i32, i32) =

  -- trivial functions for reading/writing from the stack
  let setVisited (stk: i32) (c: i32) : i32 =
      stk | (1 << c)
  let resetVisit (stk: i32) (c: i32) : i32 =
      stk & !(1 << c)
  let isVisited (stk: i32) (c: i32) : bool =
      (stk & (1 << c)) > 0i32

  let (parent_rec, stack, count, rec_node) =
      loop (node_index, stack, count, rec_node) =
           (last_leaf, stack, height, -1)
            while (node_index != 0) && (rec_node < 0) do
                -- go up the tree (and back on the stack) and find the new
                -- parent whose `second` child was not visited AND its `second`
                -- child satisfies the median condition (hence at least one
                -- of its leaves need to be visited). The parent is saved
                -- in `parent_rec`, the `second` satisfying child in `rec_node`
                -- If root has been reached and its `second` has been visited
                -- then `parent_rec` is the root and `rec_node` is -1 by convention.
                let parent = getParent node_index
                let second = node_index + addToSecond node_index in

                if isVisited stack count
                then (parent, stack, count-1, -1)
                else
                  let ack = 
                    loop ack = 0.0f32
                      for i < d do
                          let cur_q = query[i]
                          let lower = lower_bounds[second,i]
                          let upper = upper_bounds[second,i] in

                          if cur_q <= lower then
                              let res = (cur_q-lower)*(cur_q-lower)
                              in (ack + res)
                          else if cur_q >= upper then
                              let res = (cur_q-upper)*(cur_q-upper)
                              in (ack + res)
                          else (ack + 0.0)

                  let to_visit = (f32.sqrt ack) < wknn in
                  -- let to_visit = f32.abs(median_vals[parent] - query[median_dims[parent]]) < wknn in
                  if !to_visit
                  then (parent, stack, count-1, -1)
                  else
                    let second = node_index + addToSecond node_index
                    let stack  = setVisited stack count in
                    (parent, stack, count, second)


  let (new_leaf, stack, _) =
      if parent_rec == 0 && rec_node == -1
      then -- we are done, we are at the root node
           -- and its second child has been visited
           (-1, stack, 0)

      else loop (node_index, stack, count) =
                (rec_node, stack, count)
           while !(isLeaf height node_index) do
              -- now traverse downwards by starting at `rec_node`
              -- and by computing and following `first` until you
              -- reach a new leaf
              let count = count + 1
              let stack = resetVisit stack count in
              if query[median_dims[node_index]] <= median_vals[node_index]
              then ((node_index+1)*2-1, stack, count)
              else ((node_index+1)*2, stack, count)

  in (new_leaf, stack)



entry firstTraverse [d][q] (height:   i32)  (median_dims: [q]i32)
                           (query: [d]f32)  (median_vals: [q]f32) =

    let new_leaf = loop node_index = 0
        while !(isLeaf height node_index) do
          if query[median_dims[node_index]] <= median_vals[node_index]
          then (node_index+1)*2-1
          else (node_index+1)*2

    in new_leaf























