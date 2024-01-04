module GeneticVariantBase
using StatsBase
export GeneticData, Variant, VariantIterator, iterator
export chrom, pos, rsid, alleles, alt_allele, ref_allele, maf, hwepval, infoscore, load_values!

abstract type GeneticData end
abstract type Variant end
abstract type VariantIterator end

function Base.eltype(vi::VariantIterator)
    Variant
end

"""
    iterate(iter)
Returns either a tuple of the first item and initial state or nothing if empty
    iterate(iter, state)
Returns either a tuple of the next item and next state or nothing if no items remain
https://docs.julialang.org/en/v1/manual/interfaces/
"""
function Base.iterate(vi::VariantIterator,
    state=(1, nothing))
    return nothing
end

"""
    length(variant_iterator)
Returns the number of variants.
"""
function Base.length(vi::VariantIterator)::Int
    0
end

function Base.size(vi::VariantIterator)
    (Base.length(vi), )
end

"""
    iterator(g)
Creates a `VariantIterator` for `GeneticData` `g`.
"""
function iterator(g::GeneticData; startidx=1)
    @assert false "Not implemented."
end

function chrom(g::GeneticData, v::Variant)::String
    return string(1)
end

function pos(g::GeneticData, v::Variant)::Int
    return 0
end

function rsid(g::GeneticData, v::Variant)::String
    return ""
end

function alleles(g::GeneticData, v::Variant)::Vector{String}
    return []
end

function alt_allele(g::GeneticData, v::Variant)::String
    return ""
end

function ref_allele(g::GeneticData, v::Variant)::String
    return ""
end

function maf(g::GeneticData, v::Variant)
    arr = Vector{Float64}(undef, n_samples(g))
    load_values!(arr, g, v)
    maf(arr)
end

function maf(arr::AbstractArray{T}) where T <: Real
    mean_level = mean(arr)
    if mean_level < 1.0
        return mean_level / 2
    else
        return (1 - mean_level / 2)
    end
end

function hwepval(g::GeneticData, v::Variant)
    arr = Vector{Float64}(undef, n_samples(g))
    load_values!(arr, g, v)
    hwepval(arr)
end

function hwepval(arr::AbstractArray{T}) where T <: Real
    # Not applicaple for dosages. Only for genotypes or triplet probabilities (BGEN)
    return 0.0
end

function infoscore(g::GeneticData, v::Variant)
    arr = Vector{Float64}(undef, n_samples(g))
    load_values!(arr, g, v)
    info_score(arr)
end

function infoscore(arr::AbstractArray{T}) where T <: Real
    # TODO
    return 0.0
end

function load_alt_allele_dosages!(arr::AbstractArray{T}, g::GeneticData, v::Variant) where T <: Real
    # real values between 0-2. 
    return arr
end

function load_genotypes!(arr::AbstractArray{T}, g::GeneticData, v::Variant) where T <: Integer
    # integer values between 0-2. 
    return arr
end
end