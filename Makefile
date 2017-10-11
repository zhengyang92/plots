all: canonicalization.pdf instcombine.pdf
canonicalization.pdf: canonicalization.p
	gnuplot canonicalization.p

instcombine.pdf: instcombine.p
	gnuplot instcombine.p
