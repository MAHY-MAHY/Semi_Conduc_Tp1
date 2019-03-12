Module plot
  use mod_var

  use allocation

  use initialisation

contains
  subroutine gnuplot()
    Integer :: j
    REAL(PR), Dimension(Ng)::Vec_X
    
    OPEN(UNIT=61,FILE='Vec_app.txt')
    OPEN(UNIT=62,FILE='Vec_ex.txt')
    Do j=1,Ng
       Vec_X(j)=j*one/Ng
       WRITE(61,*)Vec_X(j),Vec_Uapp(j)
       WRITE(62,*)Vec_X(j),Vec_Uex(j)
    end Do
  end subroutine gnuplot
end Module plot
