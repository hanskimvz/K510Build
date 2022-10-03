	nncase ir1.7.1:Æ
w
Concat_239(Concat)Conv_240(Conv)_load_dataConv_240(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_240(Conv)/_convert_1Conv_240(Conv)_load_weightsConv_240(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_240(Conv)/psumConv_240(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_240(Conv)/actConv_240(Conv)_load_actConv_240(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_240(Conv)Sigmoid_241.(Sigmoid)/broadcastSigmoid_241.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_241.(Sigmoid)/broadcast'Sigmoid_241.(Sigmoid)/broadcast_store_0%Sigmoid_241.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_240(Conv)_load_data
Conv_240(Conv)_load_weights
Conv_240(Conv)/psum
Conv_240(Conv)_load_actConv_240(Conv)Conv_240(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_241.(Sigmoid)/broadcast_store/fusionZ-
Concat_239(Concat)


€



Z5
Conv_240(Conv)/_convert_1

€
€

Z-
Conv_240(Conv)/act



€
bB
'Sigmoid_241.(Sigmoid)/broadcast_store_0


€



j3
Conv_240(Conv)_load_data


€



j7
Conv_240(Conv)_load_weights

€
€

j.
Conv_240(Conv)/psum


€



j2
Conv_240(Conv)_load_act



€
j:
Sigmoid_241.(Sigmoid)/broadcast


€



jB
'Sigmoid_241.(Sigmoid)/broadcast_store_0


€



j)
Conv_240(Conv)


€



