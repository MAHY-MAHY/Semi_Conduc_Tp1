MODULE resolution
  !
  USE mod_var
  !
  use initialisation

  use allocation
CONTAINS

  !***********************************************************************!
  SUBROUTINE gauss_seidel ()
    !***********************************************************************!
    !
    IMPLICIT NONE
    !
    !--Declaration des arguments
    !
    !--Declaration des variables locales
    INTEGER  ::  ib, ii, jj, iter_gs, i
    INTEGER :: nbiter_max=1000
    REAL(PR)::prec_gs=0.000000001
    REAL(PR)  ::  res_max, s
    REAL(Pr),  DIMENSION(Ng)  ::  res_bloc
    REAL(PR) :: tmp
    !
    !
    !***********************************************************************!
    !
    ! 0. Initialisation de la solution approchee x0
    !
    DO i = 1, Ng
       VEC_Uapp(i) = one
    END DO
    !
!!!
    !
    iter_gs = 0
    !
    !----------------------
    ! Boucle de convergence
    !----------------------
    DO
       res_max=zero
       DO i=1,Ng,1  !!!!A verif Nelemt ou pas
          tmp=0
          DO ii=1,i-1,1
             tmp=MAT_A(i,ii)*VEC_Uapp(ii)+tmp
          END DO
          DO ii=i+1,Ng,1
             tmp=MAT_A(i,ii)*VEC_Uapp(ii)+tmp
          END DO
          IF(res_max< VEC_Uapp(i)-(MAT_B(i)-tmp)/MAT_A(i,i))then
             res_max= VEC_Uapp(i)-(MAT_B(i)-tmp)/MAT_A(i,i)
          END if
          VEC_Uapp(i)=(MAT_B(i)-tmp)/MAT_A(i,i)            
       END DO
!!!!

       !     
       !     calcul des iteres successifs
       !     
       iter_gs = iter_gs + 1
       !     
       IF (MOD(iter_gs,100) == 0) THEN
          WRITE (6,'(A,I7,ES22.15)')'iter_gs , residu_max:',iter_gs,res_max
          CALL Flush (6)
       END IF
       !     
       !     test convergence de la solution approchee
       IF ( (res_max < prec_gs) .OR. (iter_gs > nbiter_max) ) EXIT
       !     
       !     fin boucle de convergence
    END DO
    !     


    !
    RETURN
  END SUBROUTINE gauss_seidel
  !
END MODULE resolution
