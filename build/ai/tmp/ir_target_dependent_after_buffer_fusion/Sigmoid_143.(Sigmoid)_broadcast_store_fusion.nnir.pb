	nncase ir1.7.1:Æ
w
Concat_141(Concat)Conv_142(Conv)_load_dataConv_142(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_142(Conv)/_convert_1Conv_142(Conv)_load_weightsConv_142(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_142(Conv)/psumConv_142(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_142(Conv)/actConv_142(Conv)_load_actConv_142(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_142(Conv)Sigmoid_143.(Sigmoid)/broadcastSigmoid_143.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_143.(Sigmoid)/broadcast'Sigmoid_143.(Sigmoid)/broadcast_store_0%Sigmoid_143.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_142(Conv)_load_data
Conv_142(Conv)_load_weights
Conv_142(Conv)/psum
Conv_142(Conv)_load_actConv_142(Conv)Conv_142(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_143.(Sigmoid)/broadcast_store/fusionZ-
Concat_141(Concat)


€



Z5
Conv_142(Conv)/_convert_1

€
€

Z-
Conv_142(Conv)/act



€
bB
'Sigmoid_143.(Sigmoid)/broadcast_store_0


€



j3
Conv_142(Conv)_load_data


€



j7
Conv_142(Conv)_load_weights

€
€

j.
Conv_142(Conv)/psum


€



j2
Conv_142(Conv)_load_act



€
j:
Sigmoid_143.(Sigmoid)/broadcast


€



jB
'Sigmoid_143.(Sigmoid)/broadcast_store_0


€



j)
Conv_142(Conv)


€



