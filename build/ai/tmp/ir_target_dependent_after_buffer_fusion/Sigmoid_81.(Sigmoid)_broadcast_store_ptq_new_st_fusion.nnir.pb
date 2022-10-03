	nncase ir1.7.1:Í!
±
*Add_76(binary_add)/binary_add_0/ptq_new_st
"Conv_77(Conv)_load_data/const_loadConv_77(Conv)_load_dataConv_77(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_77(Conv)_load_weights/weights_constant
'Conv_77(Conv)_load_weights/load_weightsConv_77(Conv)_load_weightsConv_77(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_77(Conv)/psumConv_77(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_77(Conv)/actConv_77(Conv)_load_actConv_77(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_77(Conv)_load_data/const_load/const"Conv_77(Conv)_load_data/const_load"Conv_77(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_77(Conv)_load_weights/weights_constant/ptq_deq'Conv_77(Conv)_load_weights/load_weights'Conv_77(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_77(Conv)Sigmoid_78.(Sigmoid)/broadcastSigmoid_78.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
½
+Conv_80(Conv)_load_weights/weights_constant
'Conv_80(Conv)_load_weights/load_weightsConv_80(Conv)_load_weightsConv_80(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_80(Conv)/psumConv_80(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_80(Conv)/actConv_80(Conv)_load_actConv_80(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_80(Conv)_load_weights/weights_constant/ptq_deq'Conv_80(Conv)_load_weights/load_weights'Conv_80(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_80(Conv)Sigmoid_81.(Sigmoid)/broadcastSigmoid_81.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_81.(Sigmoid)/broadcast
:Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_77(Conv)_load_data
Conv_77(Conv)_load_weights
Conv_77(Conv)/psum
Conv_77(Conv)_load_actConv_77(Conv)Conv_77(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
·
Sigmoid_78.(Sigmoid)/broadcast
Conv_80(Conv)_load_weights
Conv_80(Conv)/psum
Conv_80(Conv)_load_actConv_80(Conv)Conv_80(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/fusionZD
*Add_76(binary_add)/binary_add_0/ptq_new_st


@
(
(ZE
+Conv_77(Conv)_load_weights/weights_constant

@
@

Z+
Conv_77(Conv)/act



@
ZB
(Conv_77(Conv)_load_data/const_load/const



@
ZM
3Conv_77(Conv)_load_weights/weights_constant/ptq_deq



@
ZE
+Conv_80(Conv)_load_weights/weights_constant

@
@

Z+
Conv_80(Conv)/act



@
ZM
3Conv_80(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j1
Conv_77(Conv)_load_data


@
(
(j4
Conv_77(Conv)_load_weights

@
@

j,
Conv_77(Conv)/psum


@
(
(j0
Conv_77(Conv)_load_act



@
j<
"Conv_77(Conv)_load_data/const_load



@
jA
'Conv_77(Conv)_load_weights/load_weights



@
j8
Sigmoid_78.(Sigmoid)/broadcast


@
(
(j4
Conv_80(Conv)_load_weights

@
@

j,
Conv_80(Conv)/psum


@
(
(j0
Conv_80(Conv)_load_act



@
jA
'Conv_80(Conv)_load_weights/load_weights



@
jT
:Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_81.(Sigmoid)/broadcast


@
(
(jK
1Sigmoid_81.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j'
Conv_77(Conv)


@
(
(j'
Conv_80(Conv)


@
(
(