	nncase ir1.7.1:®
Ç
Add_83(binary_add)/binary_add_0Conv_84(Conv)_load_dataConv_84(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Å
Conv_84(Conv)/_convert_1Conv_84(Conv)_load_weightsConv_84(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_84(Conv)/psumConv_84(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_84(Conv)/actConv_84(Conv)_load_actConv_84(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_84(Conv)Sigmoid_85.(Sigmoid)/broadcastSigmoid_85.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Å
Conv_87(Conv)/_convert_1Conv_87(Conv)_load_weightsConv_87(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_87(Conv)/psumConv_87(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_87(Conv)/actConv_87(Conv)_load_actConv_87(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_87(Conv)Sigmoid_88.(Sigmoid)/broadcastSigmoid_88.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
û
Sigmoid_88.(Sigmoid)/broadcast&Sigmoid_88.(Sigmoid)/broadcast_store_0$Sigmoid_88.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_84(Conv)_load_data
Conv_84(Conv)_load_weights
Conv_84(Conv)/psum
Conv_84(Conv)_load_actConv_84(Conv)Conv_84(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_85.(Sigmoid)/broadcast
Conv_87(Conv)_load_weights
Conv_87(Conv)/psum
Conv_87(Conv)_load_actConv_87(Conv)Conv_87(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_88.(Sigmoid)/broadcast_store/fusionZ9
Add_83(binary_add)/binary_add_0


@
(
(Z2
Conv_84(Conv)/_convert_1

@
@

Z+
Conv_84(Conv)/act



@
Z2
Conv_87(Conv)/_convert_1

@
@

Z+
Conv_87(Conv)/act



@
b@
&Sigmoid_88.(Sigmoid)/broadcast_store_0

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
j8
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
j8
Sigmoid_88.(Sigmoid)/broadcast


@
(
(j@
&Sigmoid_88.(Sigmoid)/broadcast_store_0

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