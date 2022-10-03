	nncase ir1.7.1:Ü
w
Concat_226(Concat)Conv_227(Conv)_load_dataConv_227(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
„
Conv_227(Conv)/_convert_1Conv_227(Conv)_load_weightsConv_227(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_227(Conv)/psumConv_227(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_227(Conv)/actConv_227(Conv)_load_actConv_227(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_227(Conv)Sigmoid_228.(Sigmoid)/broadcastSigmoid_228.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
„
Conv_230(Conv)/_convert_1Conv_230(Conv)_load_weightsConv_230(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_230(Conv)/psumConv_230(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_230(Conv)/actConv_230(Conv)_load_actConv_230(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_230(Conv)Sigmoid_231.(Sigmoid)/broadcastSigmoid_231.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
¡
Sigmoid_231.(Sigmoid)/broadcast'Sigmoid_231.(Sigmoid)/broadcast_store_0%Sigmoid_231.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_227(Conv)_load_data
Conv_227(Conv)_load_weights
Conv_227(Conv)/psum
Conv_227(Conv)_load_actConv_227(Conv)Conv_227(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
½
Sigmoid_228.(Sigmoid)/broadcast
Conv_230(Conv)_load_weights
Conv_230(Conv)/psum
Conv_230(Conv)_load_actConv_230(Conv)Conv_230(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_231.(Sigmoid)/broadcast_store/fusionZ-
Concat_226(Concat)


€



Z5
Conv_227(Conv)/_convert_1

€
€

Z-
Conv_227(Conv)/act



€
Z5
Conv_230(Conv)/_convert_1

€
€

Z-
Conv_230(Conv)/act



€
bB
'Sigmoid_231.(Sigmoid)/broadcast_store_0


€



j3
Conv_227(Conv)_load_data


€



j7
Conv_227(Conv)_load_weights

€
€

j.
Conv_227(Conv)/psum


€



j2
Conv_227(Conv)_load_act



€
j:
Sigmoid_228.(Sigmoid)/broadcast


€



j7
Conv_230(Conv)_load_weights

€
€

j.
Conv_230(Conv)/psum


€



j2
Conv_230(Conv)_load_act



€
j:
Sigmoid_231.(Sigmoid)/broadcast


€



jB
'Sigmoid_231.(Sigmoid)/broadcast_store_0


€



j)
Conv_227(Conv)


€



j)
Conv_230(Conv)


€



