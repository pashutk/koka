// ----------------------------------------------------------------------------
// Program
// ----------------------------------------------------------------------------
 
fun xor() : amb bool {
  val p = flip() 
  val q = flip()
  (p||q) && not(p&&q)
}

fun xors() : amb string {
  show(xor())
}

fun foo() : <amb,state> bool {
  val p = flip() 
  val i = get()
  set(i+1)
  if (i>=0 && p) then xor() else False
}         

fun foos() : <amb,state> string {
  show(foo())
}    
 
effect amb {
  fun flip() : bool
}
 
effect state {
  fun get() : int
  fun set(i : int) : ()
}



fun amb_handle() {
  handler {
    return(x) -> [x]
    ctl flip()   -> resume(False) ++ resume(True)
  }
}

fun state_handle(init,action) {
  var i := init
  handle(action) {
    return(x) -> x
    fun get()    -> i
    fun set(j)   -> i := j
  }
}
