	nncase ir1.7.1:Ü
½
6Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_91(Conv)_load_data/const_loadConv_91(Conv)_load_dataConv_91(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_91(Conv)_load_weights/weights_constant
'Conv_91(Conv)_load_weights/load_weightsConv_91(Conv)_load_weightsConv_91(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_91(Conv)/psumConv_91(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_91(Conv)/actConv_91(Conv)_load_actConv_91(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_91(Conv)_load_data/const_load/const"Conv_91(Conv)_load_data/const_load"Conv_91(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_91(Conv)_load_weights/weights_constant/ptq_deq'Conv_91(Conv)_load_weights/load_weights'Conv_91(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_91(Conv)Sigmoid_92.(Sigmoid)/broadcastSigmoid_92.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_92.(Sigmoid)/broadcast
:Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_91(Conv)_load_data
Conv_91(Conv)_load_weights
Conv_91(Conv)/psum
Conv_91(Conv)_load_actConv_91(Conv)Conv_91(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/fusionZQ
6Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€
(
(ZF
+Conv_91(Conv)_load_weights/weights_constant

@
€

Z+
Conv_91(Conv)/act



@
ZC
(Conv_91(Conv)_load_data/const_load/const



€
ZM
3Conv_91(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j2
Conv_91(Conv)_load_data


€
(
(j5
Conv_91(Conv)_load_weights

@
€

j,
Conv_91(Conv)/psum


@
(
(j0
Conv_91(Conv)_load_act



@
j=
"Conv_91(Conv)_load_data/const_load



€
jA
'Conv_91(Conv)_load_weights/load_weights



@
jT
:Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_92.(Sigmoid)/broadcast


@
(
(jK
1Sigmoid_92.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j'
Conv_91(Conv)


@
(
(