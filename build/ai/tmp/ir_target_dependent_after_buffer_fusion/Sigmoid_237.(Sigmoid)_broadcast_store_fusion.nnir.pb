	nncase ir1.7.1:Æ
w
Concat_226(Concat)Conv_236(Conv)_load_dataConv_236(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_236(Conv)/_convert_1Conv_236(Conv)_load_weightsConv_236(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_236(Conv)/psumConv_236(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_236(Conv)/actConv_236(Conv)_load_actConv_236(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_236(Conv)Sigmoid_237.(Sigmoid)/broadcastSigmoid_237.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_237.(Sigmoid)/broadcast'Sigmoid_237.(Sigmoid)/broadcast_store_0%Sigmoid_237.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_236(Conv)_load_data
Conv_236(Conv)_load_weights
Conv_236(Conv)/psum
Conv_236(Conv)_load_actConv_236(Conv)Conv_236(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_237.(Sigmoid)/broadcast_store/fusionZ-
Concat_226(Concat)


€



Z5
Conv_236(Conv)/_convert_1

€
€

Z-
Conv_236(Conv)/act



€
bB
'Sigmoid_237.(Sigmoid)/broadcast_store_0


€



j3
Conv_236(Conv)_load_data


€



j7
Conv_236(Conv)_load_weights

€
€

j.
Conv_236(Conv)/psum


€



j2
Conv_236(Conv)_load_act



€
j:
Sigmoid_237.(Sigmoid)/broadcast


€



jB
'Sigmoid_237.(Sigmoid)/broadcast_store_0


€



j)
Conv_236(Conv)


€



