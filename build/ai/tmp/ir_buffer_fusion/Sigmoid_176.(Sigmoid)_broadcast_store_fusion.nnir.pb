	nncase ir1.7.1:Æ
w
Concat_165(Concat)Conv_175(Conv)_load_dataConv_175(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_175(Conv)/_convert_1Conv_175(Conv)_load_weightsConv_175(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_175(Conv)/psumConv_175(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_175(Conv)/actConv_175(Conv)_load_actConv_175(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_175(Conv)Sigmoid_176.(Sigmoid)/broadcastSigmoid_176.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_176.(Sigmoid)/broadcast'Sigmoid_176.(Sigmoid)/broadcast_store_0%Sigmoid_176.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_175(Conv)_load_data
Conv_175(Conv)_load_weights
Conv_175(Conv)/psum
Conv_175(Conv)_load_actConv_175(Conv)Conv_175(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_176.(Sigmoid)/broadcast_store/fusionZ-
Concat_165(Concat)


€

Z5
Conv_175(Conv)/_convert_1

€
€

Z-
Conv_175(Conv)/act



€
bB
'Sigmoid_176.(Sigmoid)/broadcast_store_0


€

j3
Conv_175(Conv)_load_data


€

j7
Conv_175(Conv)_load_weights

€
€

j.
Conv_175(Conv)/psum


€

j2
Conv_175(Conv)_load_act



€
j:
Sigmoid_176.(Sigmoid)/broadcast


€

jB
'Sigmoid_176.(Sigmoid)/broadcast_store_0


€

j)
Conv_175(Conv)


€

