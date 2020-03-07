-- ==
-- entry: main
--
-- compiled input { 3i32 1024i32 8024.0f32 3000.0f32 }
-- output { [8192.0f32, 4096.0, 12288.0, 2048.0, 6144.0, 10240.0, 14336.0, 1024.0, 3072.0, 5120.0, 7168.0, 9216.0, 11264.0, 13312.0, 15360.0] [22i32, 21, 20, 19, 23, 24, 25, -1, -1, -1, -1, -1, -1, -1, -1, -1] 7i32 }

let getParent (node_index: i32) = (node_index-1) / 2

let isLeaf (h: i32) (node_index: i32) = node_index >= (1 << (h+1)) - 1

let getQuerriedLeaf (h: i32) (ppl: i32) (q: f32) =
    let leaf_ind = (t32 q) / ppl
    in  leaf_ind + (1<<(h+1)) - 1

let addToSecond (e: i32) : i32 = if (e & 1) == 1 then 1 else -1

-- This is implemented for 1-dim
-- height: the height of the tree (without leaves)
-- tree: the k-d tree, denoted `split_values` in Fabian's code
-- querry: our querry (1-dim)
-- knn:    the worse nearest neighbor
-- last_leaf: last visited leaf
-- stack:  array of booleans (which should be represented as an int)
--         which denotes whether the `second child` of a node has
--         been visited already
-- Results: the index of the new leaf and the new stack
--
let traverseOnce (height: i32) (tree:    []f32) 
                 (querry: f32) (knn:       f32)
                 (last_leaf: i32)
                 -- (stack: i32) : (i32, i32) =
                 (stack : *[]bool) : (i32, []bool) =

  -- trivial functions for reading/writing from the stack,
  --   which is maintained as an array of booleans.
  let getPackedInd (stk:  []bool) (ind: i32) : bool = stk[ind] 
  let setPackedInd (stk: *[]bool) (ind: i32) (v: bool) : *[]bool =
     let stk[ind] = v in stk

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
                let parent = getParent node_index in

                if getPackedInd stack count
                then (parent, stack, count-1, -1)
                else
                  let to_visit = f32.abs (tree[parent] - querry) < knn in
                  if !to_visit
                  then (parent, stack, count-1, -1)
                  else
                    let second = node_index + addToSecond node_index
                    let stack  = setPackedInd stack count true in
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
              let stack = setPackedInd stack count false in
              if querry <= tree[node_index]
              then ((node_index+1)*2-1, stack, count) 
              else ((node_index+1)*2, stack, count)

  in (new_leaf, stack)


-- h:   height of the tree (excluding the leaves)
-- ppl: # of points per leaf
-- q:   the querry
-- knn: the worse nearest neighbor
-- run with: echo "3 1024 8024.0f32 3000.0f32" | ./test-trav-maria-new
entry main (h: i32) (ppl: i32) (q: f32) (knn: f32)=
  let num_nodes = (1 << (h+1)) - 1
  let num_leaves=  1 << (h+1)

  -- build a naive tree that contains the values: [0 ... num_leaves * ppl - 1]
  let tree_arr  =
      loop (tree) = (replicate num_nodes 0.0f32)
      for i < (h+1) do
        let beg = (1 << i) - 1
        let len = 1 << i
        let inds = map (+beg) (iota len)
        let num_leaves_per_parent = num_leaves / len
        let num_points_per_parent = num_leaves_per_parent * ppl 
        let vals = map (\k -> r32 ((2*k+1) * num_points_per_parent / 2)) (iota len)
        in  scatter tree inds vals
  -- get the querried leaf
  let q_leaf = getQuerriedLeaf h ppl q
  
  let visits = replicate num_leaves (-1)
  let visits[0] = q_leaf

  -- propagate the querry `q` through the tree
  let (visits, _, _, loop_count) =
      loop (visits, stack, last_leaf, i) =
           (visits, replicate (h+1) false, q_leaf, 0)
         --(visits, 0i32, q_leaf, 0)
      while last_leaf != -1 do
        let (new_leaf, (stack: []bool)) =
            traverseOnce h tree_arr q knn last_leaf stack

        let visits = if new_leaf != -1 
                     then let visits[i+1] = new_leaf in visits
                     else visits
        in  (visits, stack, new_leaf, i+1)

  in (tree_arr, visits, loop_count)
