	nncase ir1.7.1:Æ
w
Concat_128(Concat)Conv_129(Conv)_load_dataConv_129(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_129(Conv)/_convert_1Conv_129(Conv)_load_weightsConv_129(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_129(Conv)/psumConv_129(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_129(Conv)/actConv_129(Conv)_load_actConv_129(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_129(Conv)Sigmoid_130.(Sigmoid)/broadcastSigmoid_130.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_130.(Sigmoid)/broadcast'Sigmoid_130.(Sigmoid)/broadcast_store_0%Sigmoid_130.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_129(Conv)_load_data
Conv_129(Conv)_load_weights
Conv_129(Conv)/psum
Conv_129(Conv)_load_actConv_129(Conv)Conv_129(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_130.(Sigmoid)/broadcast_store/fusionZ-
Concat_128(Concat)


€

Z5
Conv_129(Conv)/_convert_1

€
€

Z-
Conv_129(Conv)/act



€
bB
'Sigmoid_130.(Sigmoid)/broadcast_store_0


€

j3
Conv_129(Conv)_load_data


€

j7
Conv_129(Conv)_load_weights

€
€

j.
Conv_129(Conv)/psum


€

j2
Conv_129(Conv)_load_act



€
j:
Sigmoid_130.(Sigmoid)/broadcast


€

jB
'Sigmoid_130.(Sigmoid)/broadcast_store_0


€

j)
Conv_129(Conv)


€

