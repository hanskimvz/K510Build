	nncase ir1.7.1:�
�
+Sigmoid_99.(Sigmoid)/broadcast_store/fusionConv_101(Conv)_load_dataConv_101(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_101(Conv)/_convert_1Conv_101(Conv)_load_weightsConv_101(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_101(Conv)/psumConv_101(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_101(Conv)/actConv_101(Conv)_load_actConv_101(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_101(Conv)Sigmoid_102.(Sigmoid)/broadcastSigmoid_102.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_102.(Sigmoid)/broadcast'Sigmoid_102.(Sigmoid)/broadcast_store_0%Sigmoid_102.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_101(Conv)_load_data
Conv_101(Conv)_load_weights
Conv_101(Conv)/psum
Conv_101(Conv)_load_actConv_101(Conv)Conv_101(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_102.(Sigmoid)/broadcast_store/fusionZF
+Sigmoid_99.(Sigmoid)/broadcast_store/fusion


�

Z5
Conv_101(Conv)/_convert_1

�
�

Z-
Conv_101(Conv)/act



�
bB
'Sigmoid_102.(Sigmoid)/broadcast_store_0


�

j3
Conv_101(Conv)_load_data


�

j7
Conv_101(Conv)_load_weights

�
�

j.
Conv_101(Conv)/psum


�

j2
Conv_101(Conv)_load_act



�
j:
Sigmoid_102.(Sigmoid)/broadcast


�

jB
'Sigmoid_102.(Sigmoid)/broadcast_store_0


�

j)
Conv_101(Conv)


�

