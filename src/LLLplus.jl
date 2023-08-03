"""
Main module for `LLLplus.jl` -- lattice reduction and related tools for Julia.

As an example of the functions in the package, see [`lll`](@ref), which does
Lenstra–Lenstra–Lovász lattice reduction of a matrix.

"""
module LLLplus

using LinearAlgebra
using Printf

export
    lll,
    cvp,
    svp,
    hkz,ishkzreduced,
    brun,
    gauss,
    sizereduction,
    seysen,
    vblast,
    subsetsum,lagariasodlyzko,mdsubsetsum,
    integerfeasibility,
    rationalapprox,spigotBBP,
    minimalpolynomial,partitionintwo,
    hardsphere, hard_sphere,
    issizereduced,islllreduced,orthogonalitydefect,hermitefactor,seysencond,
    gen_qary_b,gen_qary!,
    dataTypeForGram,intTypeGivenBitsRequired

include("lll.jl")          # lll, gauss, sizereduction
include("l2.jl")           # lll on Rational{Integer} with `l2`
include("cvp.jl")          # cvp, svp
include("hkz.jl")
include("bkz.jl")
include("brun.jl")
include("seysen.jl")
include("vblast.jl")
include("applications.jl")
include("utilities.jl")
include("latticegen.jl")

include("hard_sphere.jl")  # may be deprecated in future

end # LLLplus module
