using Colors, ColorVectorSpace, FixedPointNumbers, StatsBase, ImageCore, ImageAxes, IndirectArrays
using Base.Test

mods0 = (Colors, ColorVectorSpace, FixedPointNumbers, StatsBase, ImageCore, ImageAxes, IndirectArrays, Base, Core)
ambs0 = detect_ambiguities(mods0...)

using ImageMetadata
ambs = setdiff(detect_ambiguities(ImageMetadata, mods0...), ambs0)
if !isempty(ambs)
    println("Ambiguities:")
    for a in ambs
        println(a)
    end
end
@test isempty(ambs)

include("core.jl")
include("operations.jl")

nothing
