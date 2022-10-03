	nncase ir1.7.1:¿
é
+Sigmoid_48.(Sigmoid)/broadcast_store/fusionConv_50(Conv)_load_dataConv_50(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Å
Conv_50(Conv)/_convert_1Conv_50(Conv)_load_weightsConv_50(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_50(Conv)/psumConv_50(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_50(Conv)/actConv_50(Conv)_load_actConv_50(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_50(Conv)Sigmoid_51.(Sigmoid)/broadcastSigmoid_51.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Å
Conv_53(Conv)/_convert_1Conv_53(Conv)_load_weightsConv_53(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_53(Conv)/psumConv_53(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_53(Conv)/actConv_53(Conv)_load_actConv_53(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_53(Conv)Sigmoid_54.(Sigmoid)/broadcastSigmoid_54.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
û
Sigmoid_54.(Sigmoid)/broadcast&Sigmoid_54.(Sigmoid)/broadcast_store_0$Sigmoid_54.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_50(Conv)_load_data
Conv_50(Conv)_load_weights
Conv_50(Conv)/psum
Conv_50(Conv)_load_actConv_50(Conv)Conv_50(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_51.(Sigmoid)/broadcast
Conv_53(Conv)_load_weights
Conv_53(Conv)/psum
Conv_53(Conv)_load_actConv_53(Conv)Conv_53(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_54.(Sigmoid)/broadcast_store/fusionZE
+Sigmoid_48.(Sigmoid)/broadcast_store/fusion


 
P
PZ2
Conv_50(Conv)/_convert_1

 
 

Z+
Conv_50(Conv)/act



 
Z2
Conv_53(Conv)/_convert_1

 
 

Z+
Conv_53(Conv)/act



 
b@
&Sigmoid_54.(Sigmoid)/broadcast_store_0


 
P
Pj1
Conv_50(Conv)_load_data


 
P
Pj4
Conv_50(Conv)_load_weights

 
 

j,
Conv_50(Conv)/psum


 
P
Pj0
Conv_50(Conv)_load_act



 
j8
Sigmoid_51.(Sigmoid)/broadcast


 
P
Pj4
Conv_53(Conv)_load_weights

 
 

j,
Conv_53(Conv)/psum


 
P
Pj0
Conv_53(Conv)_load_act



 
j8
Sigmoid_54.(Sigmoid)/broadcast


 
P
Pj@
&Sigmoid_54.(Sigmoid)/broadcast_store_0


 
P
Pj'
Conv_50(Conv)


 
P
Pj'
Conv_53(Conv)


 
P
P