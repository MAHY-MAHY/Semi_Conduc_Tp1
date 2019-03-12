FC=gfortran
OPC=-O2

main : gauss_seidel.o mod_var.o  prgm.o alloc.o init.o plot.o
	$(FC) $(OPC)  prgm.o mod_var.o gauss_seidel.o alloc.o init.o plot.o  -o main

plot.o:mod_var.o alloc.o init.o plot.f90
	$(FC) -c plot.f90

gauss_seidel.o:mod_var.o alloc.o init.o gauss_seidel.f90
	$(FC) -c gauss_seidel.f90
mod_var.o : mod_var.f90
	$(FC) -c mod_var.f90
init.o :  mod_var.o alloc.o init.f90
	$(FC) -c init.f90
alloc.o :  mod_var.o alloc.f90
	$(FC) -c alloc.f90
prgm.o:  mod_var.o init.o alloc.o plot.o gauss_seidel.o prgm.f90
	$(FC) -c prgm.f90
