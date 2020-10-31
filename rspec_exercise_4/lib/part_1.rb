def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    arr.count(&prc) == 1
end

def hash_select(hash, &prc)
    h = Hash.new
    hash.each { |k, v| h[k] = v if prc.call(k, v) }
    h
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| [prc1.call(ele), prc2.call(ele)].one? }
end

def proc_count(val, procs)
    procs.count { |prc| prc.call(val) }
end