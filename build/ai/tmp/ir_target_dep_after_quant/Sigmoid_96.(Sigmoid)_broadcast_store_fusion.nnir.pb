	nncase ir1.7.1:�
t
Concat_94(Concat)Conv_95(Conv)_load_dataConv_95(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_95(Conv)/_convert_1Conv_95(Conv)_load_weightsConv_95(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_95(Conv)/psumConv_95(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_95(Conv)/actConv_95(Conv)_load_actConv_95(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_95(Conv)Sigmoid_96.(Sigmoid)/broadcastSigmoid_96.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_96.(Sigmoid)/broadcast&Sigmoid_96.(Sigmoid)/broadcast_store_0$Sigmoid_96.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_95(Conv)_load_data
Conv_95(Conv)_load_weights
Conv_95(Conv)/psum
Conv_95(Conv)_load_actConv_95(Conv)Conv_95(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_96.(Sigmoid)/broadcast_store/fusionZ,
Concat_94(Concat)


�
(
(Z4
Conv_95(Conv)/_convert_1

�
�

Z,
Conv_95(Conv)/act



�
bA
&Sigmoid_96.(Sigmoid)/broadcast_store_0


�
(
(j2
Conv_95(Conv)_load_data


�
(
(j6
Conv_95(Conv)_load_weights

�
�

j-
Conv_95(Conv)/psum


�
(
(j1
Conv_95(Conv)_load_act



�
j9
Sigmoid_96.(Sigmoid)/broadcast


�
(
(jA
&Sigmoid_96.(Sigmoid)/broadcast_store_0


�
(
(j(
Conv_95(Conv)


�
(
(