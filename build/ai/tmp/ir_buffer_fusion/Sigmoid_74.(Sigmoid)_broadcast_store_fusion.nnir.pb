	nncase ir1.7.1:¿
é
+Sigmoid_68.(Sigmoid)/broadcast_store/fusionConv_70(Conv)_load_dataConv_70(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Å
Conv_70(Conv)/_convert_1Conv_70(Conv)_load_weightsConv_70(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_70(Conv)/psumConv_70(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_70(Conv)/actConv_70(Conv)_load_actConv_70(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_70(Conv)Sigmoid_71.(Sigmoid)/broadcastSigmoid_71.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Å
Conv_73(Conv)/_convert_1Conv_73(Conv)_load_weightsConv_73(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_73(Conv)/psumConv_73(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_73(Conv)/actConv_73(Conv)_load_actConv_73(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_73(Conv)Sigmoid_74.(Sigmoid)/broadcastSigmoid_74.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
û
Sigmoid_74.(Sigmoid)/broadcast&Sigmoid_74.(Sigmoid)/broadcast_store_0$Sigmoid_74.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_70(Conv)_load_data
Conv_70(Conv)_load_weights
Conv_70(Conv)/psum
Conv_70(Conv)_load_actConv_70(Conv)Conv_70(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_71.(Sigmoid)/broadcast
Conv_73(Conv)_load_weights
Conv_73(Conv)/psum
Conv_73(Conv)_load_actConv_73(Conv)Conv_73(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_74.(Sigmoid)/broadcast_store/fusionZE
+Sigmoid_68.(Sigmoid)/broadcast_store/fusion


@
(
(Z2
Conv_70(Conv)/_convert_1

@
@

Z+
Conv_70(Conv)/act



@
Z2
Conv_73(Conv)/_convert_1

@
@

Z+
Conv_73(Conv)/act



@
b@
&Sigmoid_74.(Sigmoid)/broadcast_store_0

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
j8
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
j8
Sigmoid_74.(Sigmoid)/broadcast


@
(
(j@
&Sigmoid_74.(Sigmoid)/broadcast_store_0

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