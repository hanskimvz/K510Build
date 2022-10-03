	nncase ir1.7.1:Æ
w
Concat_199(Concat)Conv_200(Conv)_load_dataConv_200(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_200(Conv)/_convert_1Conv_200(Conv)_load_weightsConv_200(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_200(Conv)/psumConv_200(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_200(Conv)/actConv_200(Conv)_load_actConv_200(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_200(Conv)Sigmoid_201.(Sigmoid)/broadcastSigmoid_201.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_201.(Sigmoid)/broadcast'Sigmoid_201.(Sigmoid)/broadcast_store_0%Sigmoid_201.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_200(Conv)_load_data
Conv_200(Conv)_load_weights
Conv_200(Conv)/psum
Conv_200(Conv)_load_actConv_200(Conv)Conv_200(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_201.(Sigmoid)/broadcast_store/fusionZ-
Concat_199(Concat)


€
(
(Z5
Conv_200(Conv)/_convert_1

€
€

Z-
Conv_200(Conv)/act



€
bB
'Sigmoid_201.(Sigmoid)/broadcast_store_0


€
(
(j3
Conv_200(Conv)_load_data


€
(
(j7
Conv_200(Conv)_load_weights

€
€

j.
Conv_200(Conv)/psum


€
(
(j2
Conv_200(Conv)_load_act



€
j:
Sigmoid_201.(Sigmoid)/broadcast


€
(
(jB
'Sigmoid_201.(Sigmoid)/broadcast_store_0


€
(
(j)
Conv_200(Conv)


€
(
(