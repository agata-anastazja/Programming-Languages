
fun throws (func, args, e) = 
  (func (args); false) 
    handle e' => 
      let 
        val argExcName = exnName e
        val thrownExcName = exnName e'
      in
        argExcName = thrownExcName
      end
