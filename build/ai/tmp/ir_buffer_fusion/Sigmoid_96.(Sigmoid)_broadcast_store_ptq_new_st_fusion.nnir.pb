	nncase ir1.7.1:‰
–
Concat_94(Concat)
 Conv_95(Conv)_load_data_deq_loadConv_95(Conv)_load_dataConv_95(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_95(Conv)_load_weights/weights_constant
'Conv_95(Conv)_load_weights/load_weightsConv_95(Conv)_load_weightsConv_95(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_95(Conv)/psumConv_95(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_95(Conv)/actConv_95(Conv)_load_actConv_95(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
–
!Conv_95(Conv)_load_data_deq_const Conv_95(Conv)_load_data_deq_load Conv_95(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_95(Conv)_load_weights/weights_constant/ptq_deq'Conv_95(Conv)_load_weights/load_weights'Conv_95(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_95(Conv)Sigmoid_96.(Sigmoid)/broadcastSigmoid_96.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_96.(Sigmoid)/broadcast
:Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_95(Conv)_load_data
Conv_95(Conv)_load_weights
Conv_95(Conv)/psum
Conv_95(Conv)_load_actConv_95(Conv)Conv_95(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ,
Concat_94(Concat)


€
(
(ZG
+Conv_95(Conv)_load_weights/weights_constant

€
€

Z,
Conv_95(Conv)/act



€
Z<
!Conv_95(Conv)_load_data_deq_const



€
ZN
3Conv_95(Conv)_load_weights/weights_constant/ptq_deq



€
Z[
@Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bL
1Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st_0


€
(
(j2
Conv_95(Conv)_load_data


€
(
(j6
Conv_95(Conv)_load_weights

€
€

j-
Conv_95(Conv)/psum


€
(
(j1
Conv_95(Conv)_load_act



€
j;
 Conv_95(Conv)_load_data_deq_load



€
jB
'Conv_95(Conv)_load_weights/load_weights



€
jU
:Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j9
Sigmoid_96.(Sigmoid)/broadcast


€
(
(jL
1Sigmoid_96.(Sigmoid)/broadcast_store/ptq_new_st_0


€
(
(j(
Conv_95(Conv)


€
(
(