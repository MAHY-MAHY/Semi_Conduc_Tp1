program prgm
  
  use allocation
  
  use mod_var

  use initialisation

  use resolution

  use plot

  Call Alloc()

  Call Calc_B()

  Call Calc_A()

  Call Calc_Uex()

  Call gauss_seidel()

  Call gnuplot()

  Write(6,*)H
  
  
end program prgm
