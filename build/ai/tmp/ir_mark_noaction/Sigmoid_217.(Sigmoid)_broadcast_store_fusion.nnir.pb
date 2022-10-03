	nncase ir1.7.1:Æ
w
Concat_206(Concat)Conv_216(Conv)_load_dataConv_216(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_216(Conv)/_convert_1Conv_216(Conv)_load_weightsConv_216(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_216(Conv)/psumConv_216(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_216(Conv)/actConv_216(Conv)_load_actConv_216(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_216(Conv)Sigmoid_217.(Sigmoid)/broadcastSigmoid_217.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_217.(Sigmoid)/broadcast'Sigmoid_217.(Sigmoid)/broadcast_store_0%Sigmoid_217.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_216(Conv)_load_data
Conv_216(Conv)_load_weights
Conv_216(Conv)/psum
Conv_216(Conv)_load_actConv_216(Conv)Conv_216(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_217.(Sigmoid)/broadcast_store/fusionZ-
Concat_206(Concat)


€

Z5
Conv_216(Conv)/_convert_1

€
€

Z-
Conv_216(Conv)/act



€
bB
'Sigmoid_217.(Sigmoid)/broadcast_store_0


€

j3
Conv_216(Conv)_load_data


€

j7
Conv_216(Conv)_load_weights

€
€

j.
Conv_216(Conv)/psum


€

j2
Conv_216(Conv)_load_act



€
j:
Sigmoid_217.(Sigmoid)/broadcast


€

jB
'Sigmoid_217.(Sigmoid)/broadcast_store_0


€

j)
Conv_216(Conv)


€

