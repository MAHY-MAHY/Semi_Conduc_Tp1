Module initialisation

  use mod_var

  use allocation

contains
  subroutine MAT_A()
    Integer:: j
    Do j=1,Ng-1
       MAT_A(j,j)=2/H(j)
       MAT(j,j+1)=-1/H(j+1)
       MAT(j+1,j)=-1/H(j)
    End Do
    MAT_A(Ng)=2/H(Ng)
  END subroutine MAT_A
  Subroutine Vec_Uex()
    Integer :: j
    
    Do j=1,N
       Vec_Uex(j)=0.5*(j+0.5)*H(j)(1-(j+0.5)*(H(j)))
    end Do
  end Subroutine Vec_Uex
end Module initialisation
