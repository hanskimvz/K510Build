	nncase ir1.7.1:‘
‘
,Sigmoid_143.(Sigmoid)/broadcast_store/fusionConv_145(Conv)_load_dataConv_145(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_145(Conv)/_convert_1Conv_145(Conv)_load_weightsConv_145(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_145(Conv)/psumConv_145(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_145(Conv)/actConv_145(Conv)_load_actConv_145(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_145(Conv)Sigmoid_146.(Sigmoid)/broadcastSigmoid_146.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
„
Conv_148(Conv)/_convert_1Conv_148(Conv)_load_weightsConv_148(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_148(Conv)/psumConv_148(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_148(Conv)/actConv_148(Conv)_load_actConv_148(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_148(Conv)Sigmoid_149.(Sigmoid)/broadcastSigmoid_149.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_149.(Sigmoid)/broadcast'Sigmoid_149.(Sigmoid)/broadcast_store_0%Sigmoid_149.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_145(Conv)_load_data
Conv_145(Conv)_load_weights
Conv_145(Conv)/psum
Conv_145(Conv)_load_actConv_145(Conv)Conv_145(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
½
Sigmoid_146.(Sigmoid)/broadcast
Conv_148(Conv)_load_weights
Conv_148(Conv)/psum
Conv_148(Conv)_load_actConv_148(Conv)Conv_148(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_149.(Sigmoid)/broadcast_store/fusionZG
,Sigmoid_143.(Sigmoid)/broadcast_store/fusion


€



Z5
Conv_145(Conv)/_convert_1

€
€

Z-
Conv_145(Conv)/act



€
Z5
Conv_148(Conv)/_convert_1

€
€

Z-
Conv_148(Conv)/act



€
bB
'Sigmoid_149.(Sigmoid)/broadcast_store_0


€



j3
Conv_145(Conv)_load_data


€



j7
Conv_145(Conv)_load_weights

€
€

j.
Conv_145(Conv)/psum


€



j2
Conv_145(Conv)_load_act



€
j:
Sigmoid_146.(Sigmoid)/broadcast


€



j7
Conv_148(Conv)_load_weights

€
€

j.
Conv_148(Conv)/psum


€



j2
Conv_148(Conv)_load_act



€
j:
Sigmoid_149.(Sigmoid)/broadcast


€



jB
'Sigmoid_149.(Sigmoid)/broadcast_store_0


€



j)
Conv_145(Conv)


€



j)
Conv_148(Conv)


€



