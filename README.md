# LLLplus

[![Build Status](https://travis-ci.org/christianpeel/LLLplus.jl.svg?branch=master)](https://travis-ci.org/christianpeel/LLLplus.jl)
[![LLLplus](http://pkg.julialang.org/badges/LLLplus_release.svg)](http://pkg.julialang.org/?pkg=LLLplus&ver=release)

This package provides the following tools, which all operate on
floating-point lattices: Lenstra-Lenstra-Lovacsz (LLL) lattice
reduction, Seysen lattice reduction, a sphere decoder, and VBLAST
matrix decomposition.

[LLL](https://en.wikipedia.org/wiki/Lenstra%E2%80%93Lenstra%E2%80%93Lov%C3%A1sz_lattice_basis_reduction_algorithm) [1]
lattice reduction is a powerful tool in computer science that is used
to cryptanalysis of public-key systems, to solve quadratic equations,
and to solve other linear problems such as in multi-terminal wireless.
The LLL is often used as a bounded-complexity approximate solution to
the
[shortest vector problem](https://en.wikipedia.org/wiki/Lattice_problem#Shortest_vector_problem_.28SVP.29)
(SVP).
Seysen [2] introduced a lattice reduction which focuses on global
optimization rather than local optimization as in LLL.

The
[closest vector problem](https://en.wikipedia.org/wiki/Lattice_problem#Closest_vector_problem_.28CVP.29)
(CVP) is related to the SVP; in the context of multi-antenna decoding
it is referred to as
[sphere-decoding](https://en.wikipedia.org/wiki/Lattice_problem#Sphere_decoding).

Finally, we include code to do a
[V-BLAST](https://en.wikipedia.org/wiki/Bell_Laboratories_Layered_Space-Time)
(Vertical-Bell Laboratories Layered Space-Time) matrix
decomposition. This decomposition is used in a detection algorithm [3] for
decoding spatially-multiplexed streams of data on multiple antennas or
other multi-terminal systems. V-BLAST is not as widely used outside of
the wireless communication community as lattice reduction and CVP
techniques such as the sphere decoder.

### Examples

Here are a few examples of using the functions in the
package on random lattices.

```julia
include("src/LLLplus.jl")
using LLLplus

# Time LLL decomposition of a 1000x1000 real matrix with randn entries 
N = 1000;
H = randn(N,N);
println("Testing LLL on $(N)x$(N) real matrix...")
@time (B,T,Q,R) = lll(H);

# Time LLL, Seysen, VBLAST decompositions of a 10x10 complex matrix with
# randn entries
N = 10;
H = randn(N,N) + im*randn(N,N);
println("Testing LLL on $(N)x$(N) complex matrix...")
@time (B,T,Q,R) = lll(H);
println("Testing Seysen on $(N)x$(N) complex matrix...")
@time (T,H_red,H_red_dual) = seysen(H);
println("Testing VBLAST on $(N)x$(N) complex matrix...")
@time (W,P,B) = vblast(H);
```

### Future work

These tools were developed and tested in the context of multi-antenna
wireless communication, and do not reflect the state-of-the art
lattice tools used for cryptography [4]. Adding these tools and the
following improvements are among changes which can be made:
* Block-Korkin-Zolotarev lattice redution, with improvements
  as in [4]
* Brun lattice reduction
* Discussion and examples of use with integer and fixed-point lattices
* Execution times for the algorithms for various dimensions averaged
  over many random Gaussian-disributed matrices
* More examples


### References

[1] Lenstra, A. K.; Lenstra, H. W., Jr.; Lovász, L. (1982). "Factoring
polynomials with rational coefficients". Mathematische Annalen 261
(4): 515–534.

[2] M. Seysen,
["Simultaneous reduction of a lattice basis and its reciprocal basis"]
(http://link.springer.com/article/10.1007%2FBF01202355) Combinatorica,
Vol 13, no 3, pp 363-376, 1993.

[3] P. W. Wolniansky, G. J. Foschini, G. D. Golden, R. A. Valenzuela
(September 1998). ["V-BLAST: An Architecture for Realizing Very High
Data Rates Over the Rich-Scattering Wireless Channel"]
(http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=738086). Proc. URSI
ISSSE: 295–300. 

[4] Y. Chen, P. Q. Nguyen (2011) ["BKZ 2.0: Better Lattice Security Estimates"]
(http://www.iacr.org/archive/asiacrypt2011/70730001/70730001.pdf).
Proc. ASIACRYPT 2011.

### Author

This module was written by
[Chris Peel](https://github.com/ChristianPeel).


