	nncase ir1.7.1:�
�
+Sigmoid_96.(Sigmoid)/broadcast_store/fusionConv_98(Conv)_load_dataConv_98(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_98(Conv)/_convert_1Conv_98(Conv)_load_weightsConv_98(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_98(Conv)/psumConv_98(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_98(Conv)/actConv_98(Conv)_load_actConv_98(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_98(Conv)Sigmoid_99.(Sigmoid)/broadcastSigmoid_99.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_99.(Sigmoid)/broadcast&Sigmoid_99.(Sigmoid)/broadcast_store_0$Sigmoid_99.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_98(Conv)_load_data
Conv_98(Conv)_load_weights
Conv_98(Conv)/psum
Conv_98(Conv)_load_actConv_98(Conv)Conv_98(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_99.(Sigmoid)/broadcast_store/fusionZF
+Sigmoid_96.(Sigmoid)/broadcast_store/fusion


�
(
(Z4
Conv_98(Conv)/_convert_1

�
�

Z,
Conv_98(Conv)/act



�
bA
&Sigmoid_99.(Sigmoid)/broadcast_store_0


�

j2
Conv_98(Conv)_load_data


�
(
(j6
Conv_98(Conv)_load_weights

�
�

j-
Conv_98(Conv)/psum


�

j1
Conv_98(Conv)_load_act



�
j9
Sigmoid_99.(Sigmoid)/broadcast


�

jA
&Sigmoid_99.(Sigmoid)/broadcast_store_0


�

j(
Conv_98(Conv)


�

