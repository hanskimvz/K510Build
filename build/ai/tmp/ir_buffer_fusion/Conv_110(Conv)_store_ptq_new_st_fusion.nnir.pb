	nncase ir1.7.1:�
�
%Conv_78(Conv)_store/ptq_new_st/fusion
#Conv_110(Conv)_load_data/const_loadConv_110(Conv)_load_dataConv_110(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_110(Conv)_load_weights/weights_constant
(Conv_110(Conv)_load_weights/load_weightsConv_110(Conv)_load_weightsConv_110(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
s
output/folded_33Conv_110(Conv)_load_actConv_110(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
)Conv_110(Conv)_load_data/const_load/const#Conv_110(Conv)_load_data/const_load#Conv_110(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_110(Conv)_load_weights/weights_constant/ptq_deq(Conv_110(Conv)_load_weights/load_weights(Conv_110(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
0Conv_110(Conv)_store/ptq_new_st/const_load/const*Conv_110(Conv)_store/ptq_new_st/const_load*Conv_110(Conv)_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
aConv_110(Conv)/psumConv_110(Conv)/psum"
module_typeJstackvm*
actionJtrue
�
Conv_110(Conv)_load_data
Conv_110(Conv)_load_weights
Conv_110(Conv)/psum
Conv_110(Conv)_load_actConv_110(Conv)Conv_110(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
�
Conv_110(Conv)
*Conv_110(Conv)_store/ptq_new_st/const_load!Conv_110(Conv)_store/ptq_new_st_0Conv_110(Conv)_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue&Conv_110(Conv)_store/ptq_new_st/fusionZ?
%Conv_78(Conv)_store/ptq_new_st/fusion


@

ZF
,Conv_110(Conv)_load_weights/weights_constant


@

Z*
output/folded_33




ZC
)Conv_110(Conv)_load_data/const_load/const



@
ZN
4Conv_110(Conv)_load_weights/weights_constant/ptq_deq




ZJ
0Conv_110(Conv)_store/ptq_new_st/const_load/const




b;
!Conv_110(Conv)_store/ptq_new_st_0




j2
Conv_110(Conv)_load_data


@

j5
Conv_110(Conv)_load_weights


@

j1
Conv_110(Conv)_load_act




j=
#Conv_110(Conv)_load_data/const_load



@
jB
(Conv_110(Conv)_load_weights/load_weights




jD
*Conv_110(Conv)_store/ptq_new_st/const_load




j-
Conv_110(Conv)/psum




j(
Conv_110(Conv)




j;
!Conv_110(Conv)_store/ptq_new_st_0




