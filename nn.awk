function mat_vec_mul(mat, vec, n, m, new_vec,  i, j, sum)
{
    for (i = 0; i < n; i++) {
        sum = 0
        for (j = 0; j < m; j++) {
            sum = sum + mat[i, j] * vec[j]
        }
        new_vec[i] = sum
    }
}

function vec_add(vec1, vec2, new_vec, n,  i)
{
    for (i = 0; i < n; i++) {
        new_vec[i] = vec1[i] + vec2[i]
    }
}

function max(x, y)
{
    if (x>y)
        return x
    else
        return y
}

function copy_vec(src, dst, n,  i)
{
    for (i = 0; i < n; i++) {
        dst[i] = src[i]
    }
}

function relu(vec, new_vec, n,  i)
{
    for (i = 0; i < n; i++) {
        new_vec[i] = max(vec[i], 0)
    }
}

function sigmoid(vec, new_vec, n,  i)
{
    for (i = 0; i < n; i++) {
        new_vec[i] = 1 / (1 + exp(-vec[i]))
    }
}

function printvec(vec, n,  i)
{
    for (i = 0; i < n; i++) {
        print "vec[" i "]=" vec[i]
    }
}