	nncase ir1.7.1:Ü
½
6Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_67(Conv)_load_data/const_loadConv_67(Conv)_load_dataConv_67(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_67(Conv)_load_weights/weights_constant
'Conv_67(Conv)_load_weights/load_weightsConv_67(Conv)_load_weightsConv_67(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_67(Conv)/psumConv_67(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_67(Conv)/actConv_67(Conv)_load_actConv_67(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_67(Conv)_load_data/const_load/const"Conv_67(Conv)_load_data/const_load"Conv_67(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_67(Conv)_load_weights/weights_constant/ptq_deq'Conv_67(Conv)_load_weights/load_weights'Conv_67(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_67(Conv)Sigmoid_68.(Sigmoid)/broadcastSigmoid_68.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_68.(Sigmoid)/broadcast
:Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_67(Conv)_load_data
Conv_67(Conv)_load_weights
Conv_67(Conv)/psum
Conv_67(Conv)_load_actConv_67(Conv)Conv_67(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/fusionZQ
6Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€
(
(ZF
+Conv_67(Conv)_load_weights/weights_constant

@
€

Z+
Conv_67(Conv)/act



@
ZC
(Conv_67(Conv)_load_data/const_load/const



€
ZM
3Conv_67(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j2
Conv_67(Conv)_load_data


€
(
(j5
Conv_67(Conv)_load_weights

@
€

j,
Conv_67(Conv)/psum


@
(
(j0
Conv_67(Conv)_load_act



@
j=
"Conv_67(Conv)_load_data/const_load



€
jA
'Conv_67(Conv)_load_weights/load_weights



@
jT
:Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_68.(Sigmoid)/broadcast


@
(
(jK
1Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j'
Conv_67(Conv)


@
(
(