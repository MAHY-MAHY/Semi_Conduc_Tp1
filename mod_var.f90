Module mod_var

  Integer,Parameter :: PR=10
  REAL(PR),allocatable,Dimension(:,:) :: MAT_A
  REAL(PR),allocatable,Dimension(:) :: MAT_B,VEC_Uapp,VEC_Uex
  REAL(PR),allocatable,Dimension(:) ::H
  INTEGER:: Ng=1000
  REAL(PR),PARAMETER::PI=acos(-1.)
  REAL(PR),PARAMETER::one=1._PR
  REAL(PR),PARAMETER::zero=0._PR
  REAL(PR),PARAMETER::tier=1._PR/3._PR
  REAL(PR),PARAMETER::sixth=1._PR/6._PR
end Module mod_var
