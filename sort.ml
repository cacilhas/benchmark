let rec qsort (data: int list) : int list =
  match data with
  | [] -> []
  | [x] -> [x]
  | data ->
    let pivot = List.nth data 0 in
    let left  = List.tl data |> List.filter (fun x -> x < pivot) |> qsort
    and right = List.tl data |> List.filter (fun x -> x >= pivot) |> qsort in
    left @ [pivot] @ right

let show (value: int) =
  print_int value
; print_string "\t"

let () =
  let data = List.init 100 (fun _ -> Random.int 100) in
  let data = qsort data in
  List.map show data |> ignore
; print_endline ""
