Module initialisation

  use mod_var

  use allocation

contains
  subroutine Calc_A()
    Integer:: j
    Do j=2,Ng-1
       MAT_A(j,j)=one/H(j)+one/H(j-1)
       MAT_A(j,j+1)=-one/H(j)
       MAT_A(j,j-1)=-one/H(j-1)
    End Do
    MAT_A(Ng,Ng)=one/H(Ng)+one/H(Ng-1)
    MAt_A(Ng,Ng-1)=-one/H(Ng-1)
    MAT_A(1,2)=-one/H(2)
    MAT_A(1,1)=one/H(1)+one/H(2)
  END subroutine CALC_A

  
  Subroutine Calc_Uex()
    Integer :: j    
    Do j=0,Ng-1
       VEC_Uex=j*H(j)*(1-j*H(j))
    end Do
  end Subroutine Calc_Uex

  Subroutine Calc_B()
    integer ::j
    REAL(PR)::pas
    pas=one/Ng
    H(1)=pas/2
    H(Ng)=pas/2
    Do j=1,Ng
       H(j)=pas
    End Do
    MAT_B=H
  End Subroutine Calc_B
  
end Module initialisation
