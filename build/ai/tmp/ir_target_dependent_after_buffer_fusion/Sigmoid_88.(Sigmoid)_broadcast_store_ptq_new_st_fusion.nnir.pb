	nncase ir1.7.1:Í!
±
*Add_83(binary_add)/binary_add_0/ptq_new_st
"Conv_84(Conv)_load_data/const_loadConv_84(Conv)_load_dataConv_84(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_84(Conv)_load_weights/weights_constant
'Conv_84(Conv)_load_weights/load_weightsConv_84(Conv)_load_weightsConv_84(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_84(Conv)/psumConv_84(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_84(Conv)/actConv_84(Conv)_load_actConv_84(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_84(Conv)_load_data/const_load/const"Conv_84(Conv)_load_data/const_load"Conv_84(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_84(Conv)_load_weights/weights_constant/ptq_deq'Conv_84(Conv)_load_weights/load_weights'Conv_84(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_84(Conv)Sigmoid_85.(Sigmoid)/broadcastSigmoid_85.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
½
+Conv_87(Conv)_load_weights/weights_constant
'Conv_87(Conv)_load_weights/load_weightsConv_87(Conv)_load_weightsConv_87(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_87(Conv)/psumConv_87(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_87(Conv)/actConv_87(Conv)_load_actConv_87(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_87(Conv)_load_weights/weights_constant/ptq_deq'Conv_87(Conv)_load_weights/load_weights'Conv_87(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_87(Conv)Sigmoid_88.(Sigmoid)/broadcastSigmoid_88.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_88.(Sigmoid)/broadcast
:Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_84(Conv)_load_data
Conv_84(Conv)_load_weights
Conv_84(Conv)/psum
Conv_84(Conv)_load_actConv_84(Conv)Conv_84(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
·
Sigmoid_85.(Sigmoid)/broadcast
Conv_87(Conv)_load_weights
Conv_87(Conv)/psum
Conv_87(Conv)_load_actConv_87(Conv)Conv_87(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/fusionZD
*Add_83(binary_add)/binary_add_0/ptq_new_st


@
(
(ZE
+Conv_84(Conv)_load_weights/weights_constant

@
@

Z+
Conv_84(Conv)/act



@
ZB
(Conv_84(Conv)_load_data/const_load/const



@
ZM
3Conv_84(Conv)_load_weights/weights_constant/ptq_deq



@
ZE
+Conv_87(Conv)_load_weights/weights_constant

@
@

Z+
Conv_87(Conv)/act



@
ZM
3Conv_87(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j1
Conv_84(Conv)_load_data


@
(
(j4
Conv_84(Conv)_load_weights

@
@

j,
Conv_84(Conv)/psum


@
(
(j0
Conv_84(Conv)_load_act



@
j<
"Conv_84(Conv)_load_data/const_load



@
jA
'Conv_84(Conv)_load_weights/load_weights



@
j8
Sigmoid_85.(Sigmoid)/broadcast


@
(
(j4
Conv_87(Conv)_load_weights

@
@

j,
Conv_87(Conv)/psum


@
(
(j0
Conv_87(Conv)_load_act



@
jA
'Conv_87(Conv)_load_weights/load_weights



@
jT
:Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_88.(Sigmoid)/broadcast


@
(
(jK
1Sigmoid_88.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j'
Conv_84(Conv)


@
(
(j'
Conv_87(Conv)


@
(
(