	nncase ir1.7.1:Æ
w
Concat_157(Concat)Conv_158(Conv)_load_dataConv_158(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_158(Conv)/_convert_1Conv_158(Conv)_load_weightsConv_158(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_158(Conv)/psumConv_158(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_158(Conv)/actConv_158(Conv)_load_actConv_158(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_158(Conv)Sigmoid_159.(Sigmoid)/broadcastSigmoid_159.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_159.(Sigmoid)/broadcast'Sigmoid_159.(Sigmoid)/broadcast_store_0%Sigmoid_159.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_158(Conv)_load_data
Conv_158(Conv)_load_weights
Conv_158(Conv)/psum
Conv_158(Conv)_load_actConv_158(Conv)Conv_158(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_159.(Sigmoid)/broadcast_store/fusionZ-
Concat_157(Concat)


€



Z5
Conv_158(Conv)/_convert_1

€
€

Z-
Conv_158(Conv)/act



€
bB
'Sigmoid_159.(Sigmoid)/broadcast_store_0


€



j3
Conv_158(Conv)_load_data


€



j7
Conv_158(Conv)_load_weights

€
€

j.
Conv_158(Conv)/psum


€



j2
Conv_158(Conv)_load_act



€
j:
Sigmoid_159.(Sigmoid)/broadcast


€



jB
'Sigmoid_159.(Sigmoid)/broadcast_store_0


€



j)
Conv_158(Conv)


€



