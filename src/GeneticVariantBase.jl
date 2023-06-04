module GeneticVariantBase
export GeneticData, Variant, VariantIterator, iterator
export chrom, pos, rsid, alleles, alt_allele, ref_allele, maf, hwepval, infoscore

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

function chrom(g::GeneticData, v::Variant)
    return 1
end

function pos(g::GeneticData, v::Variant)
    return 0
end

function rsid(g::GeneticData, v::Variant)
    return ""
end

function alleles(g::GeneticData, v::Variant)
    return []
end

function alt_allele(g::GeneticData, v::Variant)
    return ""
end

function ref_allele(g::GeneticData, v::Variant)
    return ""
end

function maf(g::GeneticData, v::Variant)
    return 0.0
end

function hwepval(g::GeneticData, v::Variant)
    return 0.0
end

function infoscore(g::GeneticData, v::Variant)
    return 0.0
end

end