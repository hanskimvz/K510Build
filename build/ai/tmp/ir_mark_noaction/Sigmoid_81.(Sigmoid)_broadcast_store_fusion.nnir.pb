	nncase ir1.7.1:®
Ç
Add_76(binary_add)/binary_add_0Conv_77(Conv)_load_dataConv_77(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Å
Conv_77(Conv)/_convert_1Conv_77(Conv)_load_weightsConv_77(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_77(Conv)/psumConv_77(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_77(Conv)/actConv_77(Conv)_load_actConv_77(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_77(Conv)Sigmoid_78.(Sigmoid)/broadcastSigmoid_78.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Å
Conv_80(Conv)/_convert_1Conv_80(Conv)_load_weightsConv_80(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_80(Conv)/psumConv_80(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_80(Conv)/actConv_80(Conv)_load_actConv_80(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_80(Conv)Sigmoid_81.(Sigmoid)/broadcastSigmoid_81.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
û
Sigmoid_81.(Sigmoid)/broadcast&Sigmoid_81.(Sigmoid)/broadcast_store_0$Sigmoid_81.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_77(Conv)_load_data
Conv_77(Conv)_load_weights
Conv_77(Conv)/psum
Conv_77(Conv)_load_actConv_77(Conv)Conv_77(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_78.(Sigmoid)/broadcast
Conv_80(Conv)_load_weights
Conv_80(Conv)/psum
Conv_80(Conv)_load_actConv_80(Conv)Conv_80(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_81.(Sigmoid)/broadcast_store/fusionZ9
Add_76(binary_add)/binary_add_0


@
(
(Z2
Conv_77(Conv)/_convert_1

@
@

Z+
Conv_77(Conv)/act



@
Z2
Conv_80(Conv)/_convert_1

@
@

Z+
Conv_80(Conv)/act



@
b@
&Sigmoid_81.(Sigmoid)/broadcast_store_0

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
j8
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
j8
Sigmoid_81.(Sigmoid)/broadcast


@
(
(j@
&Sigmoid_81.(Sigmoid)/broadcast_store_0

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