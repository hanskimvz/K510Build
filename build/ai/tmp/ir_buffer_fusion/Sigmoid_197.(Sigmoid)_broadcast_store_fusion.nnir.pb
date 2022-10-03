	nncase ir1.7.1:½
w
Concat_186(Concat)Conv_196(Conv)_load_dataConv_196(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_196(Conv)/_convert_1Conv_196(Conv)_load_weightsConv_196(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_196(Conv)/psumConv_196(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_196(Conv)/actConv_196(Conv)_load_actConv_196(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_196(Conv)Sigmoid_197.(Sigmoid)/broadcastSigmoid_197.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_197.(Sigmoid)/broadcast'Sigmoid_197.(Sigmoid)/broadcast_store_0%Sigmoid_197.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_196(Conv)_load_data
Conv_196(Conv)_load_weights
Conv_196(Conv)/psum
Conv_196(Conv)_load_actConv_196(Conv)Conv_196(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_197.(Sigmoid)/broadcast_store/fusionZ-
Concat_186(Concat)


€
(
(Z4
Conv_196(Conv)/_convert_1

@
€

Z,
Conv_196(Conv)/act



@
bA
'Sigmoid_197.(Sigmoid)/broadcast_store_0


@
(
(j3
Conv_196(Conv)_load_data


€
(
(j6
Conv_196(Conv)_load_weights

@
€

j-
Conv_196(Conv)/psum


@
(
(j1
Conv_196(Conv)_load_act



@
j9
Sigmoid_197.(Sigmoid)/broadcast


@
(
(jA
'Sigmoid_197.(Sigmoid)/broadcast_store_0


@
(
(j(
Conv_196(Conv)


@
(
(