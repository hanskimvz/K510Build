	nncase ir1.7.1:Æ
w
Concat_219(Concat)Conv_220(Conv)_load_dataConv_220(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_220(Conv)/_convert_1Conv_220(Conv)_load_weightsConv_220(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_220(Conv)/psumConv_220(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_220(Conv)/actConv_220(Conv)_load_actConv_220(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_220(Conv)Sigmoid_221.(Sigmoid)/broadcastSigmoid_221.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_221.(Sigmoid)/broadcast'Sigmoid_221.(Sigmoid)/broadcast_store_0%Sigmoid_221.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_220(Conv)_load_data
Conv_220(Conv)_load_weights
Conv_220(Conv)/psum
Conv_220(Conv)_load_actConv_220(Conv)Conv_220(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_221.(Sigmoid)/broadcast_store/fusionZ-
Concat_219(Concat)


€

Z5
Conv_220(Conv)/_convert_1

€
€

Z-
Conv_220(Conv)/act



€
bB
'Sigmoid_221.(Sigmoid)/broadcast_store_0


€

j3
Conv_220(Conv)_load_data


€

j7
Conv_220(Conv)_load_weights

€
€

j.
Conv_220(Conv)/psum


€

j2
Conv_220(Conv)_load_act



€
j:
Sigmoid_221.(Sigmoid)/broadcast


€

jB
'Sigmoid_221.(Sigmoid)/broadcast_store_0


€

j)
Conv_220(Conv)


€

