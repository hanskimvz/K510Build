	nncase ir1.7.1:å!
½
6Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_70(Conv)_load_data/const_loadConv_70(Conv)_load_dataConv_70(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_70(Conv)_load_weights/weights_constant
'Conv_70(Conv)_load_weights/load_weightsConv_70(Conv)_load_weightsConv_70(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_70(Conv)/psumConv_70(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_70(Conv)/actConv_70(Conv)_load_actConv_70(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_70(Conv)_load_data/const_load/const"Conv_70(Conv)_load_data/const_load"Conv_70(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_70(Conv)_load_weights/weights_constant/ptq_deq'Conv_70(Conv)_load_weights/load_weights'Conv_70(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_70(Conv)Sigmoid_71.(Sigmoid)/broadcastSigmoid_71.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
½
+Conv_73(Conv)_load_weights/weights_constant
'Conv_73(Conv)_load_weights/load_weightsConv_73(Conv)_load_weightsConv_73(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_73(Conv)/psumConv_73(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_73(Conv)/actConv_73(Conv)_load_actConv_73(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_73(Conv)_load_weights/weights_constant/ptq_deq'Conv_73(Conv)_load_weights/load_weights'Conv_73(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_73(Conv)Sigmoid_74.(Sigmoid)/broadcastSigmoid_74.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_74.(Sigmoid)/broadcast
:Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_70(Conv)_load_data
Conv_70(Conv)_load_weights
Conv_70(Conv)/psum
Conv_70(Conv)_load_actConv_70(Conv)Conv_70(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
·
Sigmoid_71.(Sigmoid)/broadcast
Conv_73(Conv)_load_weights
Conv_73(Conv)/psum
Conv_73(Conv)_load_actConv_73(Conv)Conv_73(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/fusionZP
6Sigmoid_68.(Sigmoid)/broadcast_store/ptq_new_st/fusion


@
(
(ZE
+Conv_70(Conv)_load_weights/weights_constant

@
@

Z+
Conv_70(Conv)/act



@
ZB
(Conv_70(Conv)_load_data/const_load/const



@
ZM
3Conv_70(Conv)_load_weights/weights_constant/ptq_deq



@
ZE
+Conv_73(Conv)_load_weights/weights_constant

@
@

Z+
Conv_73(Conv)/act



@
ZM
3Conv_73(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j1
Conv_70(Conv)_load_data


@
(
(j4
Conv_70(Conv)_load_weights

@
@

j,
Conv_70(Conv)/psum


@
(
(j0
Conv_70(Conv)_load_act



@
j<
"Conv_70(Conv)_load_data/const_load



@
jA
'Conv_70(Conv)_load_weights/load_weights



@
j8
Sigmoid_71.(Sigmoid)/broadcast


@
(
(j4
Conv_73(Conv)_load_weights

@
@

j,
Conv_73(Conv)/psum


@
(
(j0
Conv_73(Conv)_load_act



@
jA
'Conv_73(Conv)_load_weights/load_weights



@
jT
:Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_74.(Sigmoid)/broadcast


@
(
(jK
1Sigmoid_74.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j'
Conv_70(Conv)


@
(
(j'
Conv_73(Conv)


@
(
(