	nncase ir1.7.1:î
t
Concat_60(Concat)Conv_61(Conv)_load_dataConv_61(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Å
Conv_61(Conv)/_convert_1Conv_61(Conv)_load_weightsConv_61(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_61(Conv)/psumConv_61(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_61(Conv)/actConv_61(Conv)_load_actConv_61(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_61(Conv)Sigmoid_62.(Sigmoid)/broadcastSigmoid_62.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Å
Conv_64(Conv)/_convert_1Conv_64(Conv)_load_weightsConv_64(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_64(Conv)/psumConv_64(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_64(Conv)/actConv_64(Conv)_load_actConv_64(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_64(Conv)Sigmoid_65.(Sigmoid)/broadcastSigmoid_65.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
û
Sigmoid_65.(Sigmoid)/broadcast&Sigmoid_65.(Sigmoid)/broadcast_store_0$Sigmoid_65.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_61(Conv)_load_data
Conv_61(Conv)_load_weights
Conv_61(Conv)/psum
Conv_61(Conv)_load_actConv_61(Conv)Conv_61(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_62.(Sigmoid)/broadcast
Conv_64(Conv)_load_weights
Conv_64(Conv)/psum
Conv_64(Conv)_load_actConv_64(Conv)Conv_64(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_65.(Sigmoid)/broadcast_store/fusionZ+
Concat_60(Concat)


@
P
PZ2
Conv_61(Conv)/_convert_1

@
@

Z+
Conv_61(Conv)/act



@
Z3
Conv_64(Conv)/_convert_1

Ä
@

Z,
Conv_64(Conv)/act



Ä
bA
&Sigmoid_65.(Sigmoid)/broadcast_store_0


Ä
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
j8
Sigmoid_62.(Sigmoid)/broadcast


@
P
Pj5
Conv_64(Conv)_load_weights

Ä
@

j-
Conv_64(Conv)/psum


Ä
(
(j1
Conv_64(Conv)_load_act



Ä
j9
Sigmoid_65.(Sigmoid)/broadcast


Ä
(
(jA
&Sigmoid_65.(Sigmoid)/broadcast_store_0


Ä
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
Ä
(
(