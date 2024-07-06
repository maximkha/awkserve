# out_vec is also used as a doublebuffer
function runnet(vec, out_vec,  mat, bias)
{
	# init variable
	out_vec[0]=-1
	mat[0,0]=-0.20608
	mat[0,1]=-0.62907
	mat[1,0]=1.81959
	mat[1,1]=-1.15511
	mat[2,0]=1.69524
	mat[2,1]=-1.69526
	mat[3,0]=1.43765
	mat[3,1]=-1.43777
	mat[4,0]=1.59596
	mat[4,1]=-1.59607
	mat[5,0]=-2.21684
	mat[5,1]=2.22886
	mat[6,0]=1.48645
	mat[6,1]=-1.48647
	mat[7,0]=-1.46509
	mat[7,1]=-1.46513
	mat[8,0]=1.48948
	mat[8,1]=-1.48951
	mat[9,0]=1.59300
	mat[9,1]=-1.59303
	mat[10,0]=0.16184
	mat[10,1]=0.23550
	mat[11,0]=0.13237
	mat[11,1]=-0.54353
	mat[12,0]=0.36506
	mat[12,1]=-0.10798
	mat[13,0]=-0.16183
	mat[13,1]=-0.09061
	mat[14,0]=2.09623
	mat[14,1]=-1.03984
	mat[15,0]=-0.42427
	mat[15,1]=-0.05367
	mat_vec_mul(mat, vec, 16, 2, out_vec)
	bias[0]=-0.43809
	bias[1]=1.15511
	bias[2]=-0.00000
	bias[3]=0.00004
	bias[4]=0.00001
	bias[5]=0.00010
	bias[6]=-0.00000
	bias[7]=1.46502
	bias[8]=-0.00001
	bias[9]=0.00003
	bias[10]=-0.42764
	bias[11]=-0.21171
	bias[12]=-0.38372
	bias[13]=-0.05409
	bias[14]=1.03993
	bias[15]=-0.60037
	vec_add(out_vec, bias, vec, 16)
	relu(vec, out_vec, 16)
	copy_vec(out_vec, vec, 16)
	mat[0,0]=-0.05982
	mat[0,1]=2.14187
	mat[0,2]=-1.63996
	mat[0,3]=-2.32010
	mat[0,4]=-1.60644
	mat[0,5]=-2.39300
	mat[0,6]=-2.40366
	mat[0,7]=2.04622
	mat[0,8]=-1.81239
	mat[0,9]=-1.93704
	mat[0,10]=-0.19226
	mat[0,11]=0.04215
	mat[0,12]=0.04606
	mat[0,13]=-0.18774
	mat[0,14]=1.64566
	mat[0,15]=-0.06397
	mat_vec_mul(mat, vec, 1, 16, out_vec)
	bias[0]=-0.61287
	vec_add(out_vec, bias, vec, 1)
	sigmoid(vec, out_vec, 1)
	copy_vec(out_vec, vec, 1)
}
