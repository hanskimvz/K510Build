	nncase ir1.7.1:�
�
+Sigmoid_99.(Sigmoid)/broadcast_store/fusionConv_125(Conv)_load_dataConv_125(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_125(Conv)/_convert_1Conv_125(Conv)_load_weightsConv_125(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_125(Conv)/psumConv_125(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_125(Conv)/actConv_125(Conv)_load_actConv_125(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_125(Conv)Sigmoid_126.(Sigmoid)/broadcastSigmoid_126.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_126.(Sigmoid)/broadcast'Sigmoid_126.(Sigmoid)/broadcast_store_0%Sigmoid_126.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_125(Conv)_load_data
Conv_125(Conv)_load_weights
Conv_125(Conv)/psum
Conv_125(Conv)_load_actConv_125(Conv)Conv_125(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue,Sigmoid_126.(Sigmoid)/broadcast_store/fusionZF
+Sigmoid_99.(Sigmoid)/broadcast_store/fusion


�

Z5
Conv_125(Conv)/_convert_1

�
�

Z-
Conv_125(Conv)/act



�
bB
'Sigmoid_126.(Sigmoid)/broadcast_store_0


�

j3
Conv_125(Conv)_load_data


�

j7
Conv_125(Conv)_load_weights

�
�

j.
Conv_125(Conv)/psum


�

j2
Conv_125(Conv)_load_act



�
j:
Sigmoid_126.(Sigmoid)/broadcast


�

jB
'Sigmoid_126.(Sigmoid)/broadcast_store_0


�

j)
Conv_125(Conv)


�

