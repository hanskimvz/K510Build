	nncase ir1.7.1:�
�
Conv_101(Conv)_store/ptq_new_st
#Conv_104(Conv)_load_data/const_loadConv_104(Conv)_load_dataConv_104(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_104(Conv)_load_weights/weights_constant
(Conv_104(Conv)_load_weights/load_weightsConv_104(Conv)_load_weightsConv_104(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_104(Conv)/psumConv_104(Conv)/psum"
module_typeJstackvm*
actionJtrue
s
output/folded_32Conv_104(Conv)_load_actConv_104(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
)Conv_104(Conv)_load_data/const_load/const#Conv_104(Conv)_load_data/const_load#Conv_104(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_104(Conv)_load_weights/weights_constant/ptq_deq(Conv_104(Conv)_load_weights/load_weights(Conv_104(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_106(Conv)_load_weights/weights_constant
(Conv_106(Conv)_load_weights/load_weightsConv_106(Conv)_load_weightsConv_106(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_106(Conv)/psumConv_106(Conv)/psum"
module_typeJstackvm*
actionJtrue
u
Conv_106(Conv)/actConv_106(Conv)_load_actConv_106(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_106(Conv)_load_weights/weights_constant/ptq_deq(Conv_106(Conv)_load_weights/load_weights(Conv_106(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
0Conv_106(Conv)_store/ptq_new_st/const_load/const*Conv_106(Conv)_store/ptq_new_st/const_load*Conv_106(Conv)_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_104(Conv)
Conv_106(Conv)_load_weights
Conv_106(Conv)/psum
Conv_106(Conv)_load_actConv_106(Conv)Conv_106(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
�
Conv_106(Conv)
*Conv_106(Conv)_store/ptq_new_st/const_load!Conv_106(Conv)_store/ptq_new_st_0Conv_106(Conv)_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_104(Conv)_load_data
Conv_104(Conv)_load_weights
Conv_104(Conv)/psum
Conv_104(Conv)_load_actConv_104(Conv)Conv_104(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue&Conv_106(Conv)_store/ptq_new_st/fusionZ9
Conv_101(Conv)_store/ptq_new_st



(
(ZF
,Conv_104(Conv)_load_weights/weights_constant




Z*
output/folded_32




ZC
)Conv_104(Conv)_load_data/const_load/const




ZN
4Conv_104(Conv)_load_weights/weights_constant/ptq_deq




ZF
,Conv_106(Conv)_load_weights/weights_constant




Z,
Conv_106(Conv)/act




ZN
4Conv_106(Conv)_load_weights/weights_constant/ptq_deq




ZJ
0Conv_106(Conv)_store/ptq_new_st/const_load/const




b;
!Conv_106(Conv)_store/ptq_new_st_0



(
(j2
Conv_104(Conv)_load_data



(
(j5
Conv_104(Conv)_load_weights




j-
Conv_104(Conv)/psum



(
(j1
Conv_104(Conv)_load_act




j=
#Conv_104(Conv)_load_data/const_load




jB
(Conv_104(Conv)_load_weights/load_weights




j5
Conv_106(Conv)_load_weights




j-
Conv_106(Conv)/psum



(
(j1
Conv_106(Conv)_load_act




jB
(Conv_106(Conv)_load_weights/load_weights




jD
*Conv_106(Conv)_store/ptq_new_st/const_load




j(
Conv_106(Conv)



(
(j;
!Conv_106(Conv)_store/ptq_new_st_0



(
(j(
Conv_104(Conv)



(
(