Module allocation

  use mod_var

contains
  subroutine Alloc()
    Allocate(MAT_A(Ng,Ng))
    Allocate(VEC_Uapp(Ng))
    Allocate(H(Ng))
    Allocate(MAT_B(Ng))
    Allocate(VEC_Uex(Ng))
  end subroutine Alloc
end Module allocation
