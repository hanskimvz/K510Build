	nncase ir1.7.1:’!
–
Concat_60(Concat)
 Conv_61(Conv)_load_data_deq_loadConv_61(Conv)_load_dataConv_61(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_61(Conv)_load_weights/weights_constant
'Conv_61(Conv)_load_weights/load_weightsConv_61(Conv)_load_weightsConv_61(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_61(Conv)/psumConv_61(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_61(Conv)/actConv_61(Conv)_load_actConv_61(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
–
!Conv_61(Conv)_load_data_deq_const Conv_61(Conv)_load_data_deq_load Conv_61(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_61(Conv)_load_weights/weights_constant/ptq_deq'Conv_61(Conv)_load_weights/load_weights'Conv_61(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_61(Conv)Sigmoid_62.(Sigmoid)/broadcastSigmoid_62.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
½
+Conv_64(Conv)_load_weights/weights_constant
'Conv_64(Conv)_load_weights/load_weightsConv_64(Conv)_load_weightsConv_64(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_64(Conv)/psumConv_64(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_64(Conv)/actConv_64(Conv)_load_actConv_64(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_64(Conv)_load_weights/weights_constant/ptq_deq'Conv_64(Conv)_load_weights/load_weights'Conv_64(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_64(Conv)Sigmoid_65.(Sigmoid)/broadcastSigmoid_65.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_65.(Sigmoid)/broadcast
:Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_61(Conv)_load_data
Conv_61(Conv)_load_weights
Conv_61(Conv)/psum
Conv_61(Conv)_load_actConv_61(Conv)Conv_61(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
·
Sigmoid_62.(Sigmoid)/broadcast
Conv_64(Conv)_load_weights
Conv_64(Conv)/psum
Conv_64(Conv)_load_actConv_64(Conv)Conv_64(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ+
Concat_60(Concat)


@
P
PZE
+Conv_61(Conv)_load_weights/weights_constant

@
@

Z+
Conv_61(Conv)/act



@
Z;
!Conv_61(Conv)_load_data_deq_const



@
ZM
3Conv_61(Conv)_load_weights/weights_constant/ptq_deq



@
ZF
+Conv_64(Conv)_load_weights/weights_constant

€
@

Z,
Conv_64(Conv)/act



€
ZN
3Conv_64(Conv)_load_weights/weights_constant/ptq_deq



€
Z[
@Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bL
1Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st_0


€
(
(j1
Conv_61(Conv)_load_data


@
P
Pj4
Conv_61(Conv)_load_weights

@
@

j,
Conv_61(Conv)/psum


@
P
Pj0
Conv_61(Conv)_load_act



@
j:
 Conv_61(Conv)_load_data_deq_load



@
jA
'Conv_61(Conv)_load_weights/load_weights



@
j8
Sigmoid_62.(Sigmoid)/broadcast


@
P
Pj5
Conv_64(Conv)_load_weights

€
@

j-
Conv_64(Conv)/psum


€
(
(j1
Conv_64(Conv)_load_act



€
jB
'Conv_64(Conv)_load_weights/load_weights



€
jU
:Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j9
Sigmoid_65.(Sigmoid)/broadcast


€
(
(jL
1Sigmoid_65.(Sigmoid)/broadcast_store/ptq_new_st_0


€
(
(j'
Conv_61(Conv)


@
P
Pj(
Conv_64(Conv)


€
(
(